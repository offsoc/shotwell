#include "shotwell-facedetect.hpp"

#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/objdetect/objdetect.hpp>

#ifdef HAS_OPENCV_DNN
    #include <opencv2/dnn.hpp>
#endif

#include <iostream>

// Global variable for DNN to generate vector out of face
#ifdef HAS_OPENCV_DNN
static cv::dnn::Net faceRecogNet;
static cv::dnn::Net faceDetectNet;
#endif

static cv::CascadeClassifier cascade;
static bool disableDnn{ true };

constexpr char OPENFACE_RECOG_TORCH_NET[]{ "openface.nn4.small2.v1.t7" };
constexpr char RESNET_DETECT_CAFFE_NET[]{ "res10_300x300_ssd_iter_140000_fp16.caffemodel" };
constexpr char HAARCASCADE[]{ "haarcascade_frontalface_alt.xml" };

std::vector<cv::Rect> detectFacesMat(cv::Mat img);
std::vector<double> faceToVecMat(cv::Mat img);

// Detect faces in a photo
std::vector<FaceRect> detectFaces(cv::String inputName, cv::String cascadeName, double scale, bool infer = false) {
    if(cascade.empty()) {
        g_warning("No cascade file loaded. Did you call loadNet()?");
        return {};
    }

	if (inputName.empty()) {
        g_warning("No file to process. aborting");
        return {};
	}

    cv::Mat img = cv::imread(inputName, 1);
	if (img.empty()) {
        std::cout << "error;Could not load the file to process. Filename: \"" << inputName << "\"" << std::endl;
	}

    std::vector<cv::Rect> faces;
    cv::Size smallImgSize;

#ifdef HAS_OPENCV_DNN
    disableDnn = faceDetectNet.empty();
#else
    disableDnn = true;
#endif
    if (disableDnn) {
        // Classical face detection
        cv::Mat gray;
        cvtColor(img, gray, cv::COLOR_BGR2GRAY);

        cv::Mat smallImg(cvRound(img.rows / scale), cvRound(img.cols / scale), CV_8UC1);
        smallImgSize = smallImg.size();

        cv::resize(gray, smallImg, smallImgSize, 0, 0, cv::INTER_LINEAR);
        cv::equalizeHist(smallImg, smallImg);
        cascade.detectMultiScale(smallImg, faces, 1.1, 2, cv::CASCADE_SCALE_IMAGE, cv::Size(30, 30));
    } else {
#ifdef HAS_OPENCV_DNN
        // DNN based face detection
        faces = detectFacesMat(img);
        smallImgSize = img.size(); // Not using the small image here
#endif
    }

    std::vector<FaceRect> scaled;
    for (std::vector<cv::Rect>::const_iterator r = faces.begin(); r != faces.end(); r++) {
        FaceRect i;
        i.x = (float) r->x / smallImgSize.width;
        i.y = (float) r->y / smallImgSize.height;
        i.width = (float) r->width / smallImgSize.width;
        i.height = (float) r->height / smallImgSize.height;
#ifdef HAS_OPENCV_DNN
        if (infer && !faceRecogNet.empty()) {
            // Get colour image for vector generation
            cv::Mat colourImg;
            cv::resize(img, colourImg, smallImgSize, 0, 0, cv::INTER_LINEAR);
            i.vec = faceToVecMat(colourImg(*r)); // Run vector conversion on the face
        }
#endif
        scaled.push_back(i);
    }

    return scaled;
}

// Load network into global var
bool loadNet(cv::String baseDir) {
    cascade.load(baseDir + "/" + HAARCASCADE);
    if(cascade.empty()) {
        g_warning("Failed to load haarcascade file: %s/%s", baseDir.c_str(), HAARCASCADE);
    } else {
        g_debug("Successfully loaded haarcascade %s/%s", baseDir.c_str(), HAARCASCADE);
    }
#ifdef HAS_OPENCV_DNN
    try {
        faceDetectNet = cv::dnn::readNetFromCaffe(baseDir + "/deploy.prototxt",
                                                  baseDir + "/" + RESNET_DETECT_CAFFE_NET);
        faceRecogNet = cv::dnn::readNetFromTorch(baseDir + "/" + OPENFACE_RECOG_TORCH_NET);
    } catch(cv::Exception &e) {
        std::cout << "File load failed: " << e.msg << std::endl;
        disableDnn = true;
    }

    if (faceRecogNet.empty() || faceDetectNet.empty()) {
        std::cout << "Loading open-face net failed!" << std::endl;
        disableDnn = true;
        return false;
    } else {
        disableDnn = false;
        return true;
    }
#else
    return not cascade.empty();
#endif
}

// Face detector
// Adapted from OpenCV example:
// https://github.com/opencv/opencv/blob/master/samples/dnn/js_face_recognition.html
std::vector<cv::Rect> detectFacesMat(cv::Mat img) {
    std::vector<cv::Rect> faces;
#ifdef HAS_OPENCV_DNN
    cv::Mat blob = cv::dnn::blobFromImage(img, 1.0, cv::Size(128*8, 96*8),
                                          cv::Scalar(104, 177, 123, 0), false, false);
    faceDetectNet.setInput(blob);
    cv::Mat out = faceDetectNet.forward();
    // out is a 4D matrix [1 x 1 x n x 7]
    // n - number of results
    assert(out.dims == 4);
    int outIdx[4] = { 0, 0, 0, 0 };
    for (int i = 0, n = out.size[2]; i < n; i++) {
        outIdx[2] = i; outIdx[3] = 2;
        float confidence = out.at<float>(outIdx);
        outIdx[3]++;
        float left = out.at<float>(outIdx) * img.cols;
        outIdx[3]++;
        float top = out.at<float>(outIdx) * img.rows;
        outIdx[3]++;
        float right = out.at<float>(outIdx) * img.cols;
        outIdx[3]++;
        float bottom = out.at<float>(outIdx) * img.rows;
        left = std::min(std::max(0.0f, left), (float)img.cols - 1);
        right = std::min(std::max(0.0f, right), (float)img.cols - 1);
        bottom = std::min(std::max(0.0f, bottom), (float)img.rows - 1);
        top = std::min(std::max(0.0f, top), (float)img.rows - 1);
        if (confidence > 0.98 && left < right && top < bottom) {
            cv::Rect rect(left, top, right - left, bottom - top);
            faces.push_back(rect);
        }
    }
#endif // HAS_OPENCV_DNN
    return faces;
}

// Face to vector convertor
// Adapted from OpenCV example:
// https://github.com/opencv/opencv/blob/master/samples/dnn/js_face_recognition.html
#ifdef HAS_OPENCV_DNN
std::vector<double> faceToVecMat(cv::Mat img) {
    std::vector<double> ret;
    cv::Mat smallImg(96, 96, CV_8UC1);
    cv::Size smallImgSize = smallImg.size();

    cv::resize(img, smallImg, smallImgSize, 0, 0, cv::INTER_LINEAR);
    // Generate 128 element face vector using DNN
    cv::Mat blob = cv::dnn::blobFromImage(smallImg, 1.0 / 255, smallImgSize,
                                          cv::Scalar(), true, false);
    faceRecogNet.setInput(blob);
    cv::Mat vec = faceRecogNet.forward();
    // Return vector
    for (int i = 0; i < vec.rows; ++i)
        ret.insert(ret.end(), vec.ptr<float>(i), vec.ptr<float>(i) + vec.cols);
    return ret;
}
#endif

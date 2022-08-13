/* 
 * Copyright 2018 Narendra A (narendra_m_a(at)yahoo dot com)
 * 
 * This software is licensed under the GNU LGPL (version 2.1 or later).
 * See the COPYING file in this distribution.
 *
 * Header file for facedetect/recognition routines
 */

#pragma once

#include <opencv2/core/core.hpp>

#include <algorithm>
#include <iostream>
#include <stdio.h>

struct FaceRect {
    FaceRect()
      : vec(128, 0)
    {
    }
    float x{ 0.0F };
    float y{ 0.0F };
    float width{ 0.0F };
    float height{ 0.0F };
    std::vector<double> vec;
};

bool loadNet(cv::String netFile);
std::vector<FaceRect> detectFaces(cv::String inputName, cv::String cascadeName, double scale, bool infer);
std::vector<double> faceToVec(cv::String inputName);

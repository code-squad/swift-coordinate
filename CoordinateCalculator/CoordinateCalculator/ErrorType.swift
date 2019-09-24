//
/******************************************************************************
 * File Name        : ErrorType.swift
 * Description      : CoordinateCalculator
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

enum ErrorType: Error {
    case noProcessor
    case canNotConvertToPolygon
    
    case isNotString
    case inCorrectFormat
    case canNotConvertToInt
    case outOfRange
    case unknown
    
    var description: String{
        switch self{
        case .noProcessor:
            return "Input 처리자가 없습니다."
        case .canNotConvertToPolygon:
            return "Polygon으로 변환할 수 없습니다."
            
        case .isNotString:
            return "잘못된 입력입니다."
        case .inCorrectFormat:
        return "잘못된 형식의 입력입니다."
        case .canNotConvertToInt:
            return "정수로 입력하세요."
        case .outOfRange:
            return "표시할수 있는 좌표값을 벗어났습니다. "
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}

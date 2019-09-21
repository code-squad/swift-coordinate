//
/******************************************************************************
 * File Name        : Coodinatable.swift
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

protocol Coodinatable {
    var x: Int { get }
    var y: Int { get }
    
    func convertToCoodinate() -> (x: Int, y: Int)
    
}

extension Coodinatable {
    func convertToCoodinate() -> (x: Int, y: Int) {
        let convertedX: Int = ANSICode.axis.AxisXBorder + (x*2)
        let convertedY: Int = (ANSICode.axis.AxisLimit+1 - y)
        
        return (x: convertedX, y: convertedY)
    }
    
}

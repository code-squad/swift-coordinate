//
/******************************************************************************
 * File Name        : Polygonable.swift
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


protocol Polygonable {
    
    func draw(outView: OutputView)
    func calculateArea() -> Double?
    func printResult(outView: OutputView, area: Double?)

}

extension Polygonable {
    
    func calculateArea() -> Double? {
        return nil
    }
    
    func printResult(outView: OutputView, area: Double?) {
        //set optional
    }
    
}

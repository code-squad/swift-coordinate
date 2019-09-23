//
/******************************************************************************
 * File Name        : InputView.swift
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

struct InputView {
    
    static func readInput() -> Coodinatable {
        print("좌표를 입력하세요.")
        var inputSyntex = "(0,0)"
        let typedSyntex = readLine() ?? ""
        if InputVerifier.canUse(syntex: typedSyntex) {
            inputSyntex = typedSyntex
        }
        
        return InputVerifier.parseToPoint(inputSyntex)
    }
}

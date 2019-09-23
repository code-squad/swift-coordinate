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
    var verifier: InputVerifier?
    
    init(verifier: InputVerifier?) {
        self.verifier = verifier
    }
    
    func readInput() -> Coodinatable? {
        print("좌표를 입력하세요.")
        var inputSyntex = "(0,0)"
        let typedSyntex = readLine() ?? ""
        
        var result: Coodinatable? = nil
        
        guard let verifier = verifier else {
            return result
        }
        
        if verifier.canUse(syntex: typedSyntex) {
            inputSyntex = typedSyntex
        }
        
        result = verifier.parseToPoint(inputSyntex)
        
        return result
    }
}

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
        
        guard let verifier = verifier else {
            print("ERR: there's no verifier")
            return nil
        }
        
        print("좌표를 입력하세요.")
        var typedSyntex: String?
        var point: Coodinatable?
        repeat {
            typedSyntex = readLine()
             
            if verifier.canUse(syntex: typedSyntex) {
                point = verifier.parseToPoint(typedSyntex)
            }
            if point == nil {
                print("다시 입력 바랍니다")
            }
        }
        while ( point == nil )
        
        return point
    }
}

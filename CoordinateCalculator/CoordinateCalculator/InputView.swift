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
    
    func readInput() -> [Coodinatable] {
        
        guard let verifier = verifier else {
            print("ERR: there's no verifier")
            return []
        }
        
        print("좌표를 입력하세요.")
        var typedSyntex: String?
        var points: [Coodinatable] = []
        repeat {
            typedSyntex = readLine()
             
            if verifier.canUse(syntex: typedSyntex) {
                let seperates = verifier.seperate(typedSyntex)
                for seperate in seperates {
                    if let point = verifier.parseToPoint(seperate) {
                        points.append(point)
                    }
                }
            }
            if points.isEmpty {
                print("다시 입력 바랍니다")
            }
        }
        while (points.isEmpty)
        
        return points
    }
}

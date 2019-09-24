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
    private var processor: InputProcessor?
    
    init(processor: InputProcessor?) {
        self.processor = processor
    }
    
    func readInput()throws -> [Coodinatable] {
        
        guard let processor = processor else {
            throw ErrorType.noProcessor
        }
        
        print("좌표를 입력하세요.")
        var typedSyntex: String?
        var points: [Coodinatable] = []
        repeat {
            typedSyntex = readLine()
             
            do {
                if try processor.canUse(syntex: typedSyntex) {
                    let seperates = processor.seperate(typedSyntex)
                    for seperate in seperates {
                        if let point = try processor.makePoint(seperate) {
                            points.append(point)
                        }
                    }
                }
            } catch let error as ErrorType {
                print(error.description)
            } catch {
                print(ErrorType.unknown.description)
            }
            if points.isEmpty {
                print("다시 입력 바랍니다")
            }
        }
        while (points.isEmpty)
        
        return points
    }
}

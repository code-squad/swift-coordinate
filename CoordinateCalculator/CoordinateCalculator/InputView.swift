//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var inputCoordinate = ""
    
    mutating func readInput() {
        print("좌표를 입력하세요.")
        if let inputCoordinate = readLine(){
            self.inputCoordinate = inputCoordinate
        }
    }
    func separateCoordinateNumber(inputValue: String) -> MyPoint {
        var isStart: Bool = false
        var stackOfNumber: [Int] = []
        var countOfStack = 0
        var indexOfNumber = 0
        var x = 0, y = 0
        
        for i in 0..<inputValue.count {
            let indexOfValue = inputValue.index(inputValue.startIndex, offsetBy: i)
            print(inputValue[indexOfValue])
            if inputValue[indexOfValue] == "(" {
                isStart = true
                continue
            }else if isStart {
                if inputValue[indexOfValue] >= "0" && inputValue[indexOfValue] <= "9" {
                    stackOfNumber.append(Int(String(inputValue[indexOfValue]))!)
                    countOfStack += 1
                }else if inputValue[indexOfValue] == "," {
                    for index in 0..<countOfStack {
                        x = (stackOfNumber[indexOfNumber] + Int(truncating: NSDecimalNumber(decimal: pow(10.0, index))))
                        indexOfNumber += 1
                    }
                }else if inputValue[indexOfValue] == ")" {
                    for index in 0..<(countOfStack-indexOfNumber) {
                        y = (stackOfNumber[indexOfNumber] + Int(truncating: NSDecimalNumber(decimal: pow(10.0, index))))
                        indexOfNumber += 1
                    }
                    isStart = false
                }else {
                    print("input value is not number")
                }
            }else {
                print("input word is not (decimal,decimal) type")
            }
        }
        let myPoint = MyPoint(x: x, y: y)
        return myPoint
    }
}


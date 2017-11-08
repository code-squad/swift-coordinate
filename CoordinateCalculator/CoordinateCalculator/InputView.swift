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
    
    mutating func readInput() -> String {
        print("좌표를 입력하세요.")
        if let inputCoordinate = readLine(){
            self.inputCoordinate = inputCoordinate
        }
        return inputCoordinate
    }
    mutating func separateCoordinateNumber() -> MyPoint {
        var inputValue = inputCoordinate
        inputValue.remove(at: inputValue.startIndex)
        inputValue.remove(at: inputValue.index(inputValue.startIndex, offsetBy: inputValue.count-1))
        let number = inputValue.split(separator: ",").map{String($0)}
        
        let myPoint = MyPoint(x: Int(number[0])!, y: Int(number[1])!)
        return myPoint
    }
}


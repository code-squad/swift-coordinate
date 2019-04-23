//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by hw on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


typealias pair = (Int, Int)


struct InputView {
    static let maxRange: Int = 24
    static let minRange: Int = 0
   
    func readInput() throws -> pair {
        print("input (x,y) coordinate input > ")
        let input: String? = readLine()
        guard  input != nil && !(input?.isEmpty ?? true) else {
            throw errorCode.invalidInput
        }
        guard let splitPointsArray = input?.split(separator: ",") else{
            throw errorCode.splitPointError
        }
        let pointArray = splitPointsArray.map{ (value) in return String(value) }
        guard let pointX = Int(pointArray[0]) , let pointY = Int(pointArray[1]) else{
            throw errorCode.isNotANumber
        }
        if pointX > InputView.maxRange || pointX < InputView.minRange || pointY > InputView.maxRange || pointY < InputView.minRange {
            throw errorCode.invalidRange
        }
        return pair(pointX, pointY)
    }
    
}

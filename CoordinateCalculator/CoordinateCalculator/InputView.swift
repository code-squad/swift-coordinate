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
   
    func printInputXMessage(){
        print("input x coordinate input > ")
    }
    
    func printInputYMessage(){
        print("input y coordinate input > ")
    }
    
    func readInputUtil () throws -> Int {
        let point = try readEachPoint()
        let convertPointToNumber = try convertStringToNumber(point)
        if !isInRange(point: convertPointToNumber) {
            throw errorCode.invalidRange
        }
        return convertPointToNumber
    }
    
    func readEachPoint() throws -> String {
        let input: String? = readLine()
        guard input != nil && !(input?.isEmpty ?? true) else {
            throw errorCode.invalidInput
        }
        return input!
    }
    
    func convertStringToNumber(_ input: String )throws -> Int {
        guard let pointNumber = Int(input) else{
            throw errorCode.isNotANumber
        }
        return pointNumber
    }
    
    private func isInRange(point: Int)  -> Bool {
        if point > InputView.maxRange || point < InputView.minRange {
            return false
        }
        return true
    }
    
    func readInput() throws -> pair {
        printInputXMessage()
        let pointX: Int = try readInputUtil()
        printInputYMessage()
        let pointY: Int = try readInputUtil()
        return pair(pointX, pointY)
    }
    
}

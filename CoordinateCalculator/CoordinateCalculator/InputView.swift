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
    static private let maxRange: Int = 24
    static private let minRange: Int = 0
   
    private func printInputMessage(){
        print("(x,y) coordinate (ex; (2,5) ) > ")
    }
    
    private func readInputUtil () throws -> pair{
        let point = try readEachPoint()
        let (preprocessedPointX, preprocessedPointY) = try splitPoints(point)
        let (pointX, pointY) = try convertStringToNumber(preprocessedPointX,preprocessedPointY)
        if !isInRange(pointX, pointY) {
            throw errorCode.invalidRange
        }
        return pair(pointX, pointY)
    }
    private func splitPoints (_ point: String) throws -> ( String, String) {
        let splitAPairOfPoint: [String] = point.trimmingCharacters(in: ["(",")"])
                                                .split(separator: ",")
                                                .map { (value) in return String(value)}
        if splitAPairOfPoint.count != 2 {
            throw errorCode.splitStringError
        }
        return (splitAPairOfPoint[0], splitAPairOfPoint[1])
    }
    private func readEachPoint() throws -> String {
//        let input: String? = readLine()
        guard let input = readLine() else {
            throw errorCode.invalidInput
        }
        return input
    }
    
    private func convertStringToNumber(_ x: String, _ y: String )throws -> pair {
        guard let pointX = Int(x) else{
            throw errorCode.isNotANumber
        }
        guard let pointY = Int(y) else{
            throw errorCode.isNotANumber
        }
        return pair(pointX, pointY)
    }
    
    private func isInRange(_ x: Int, _ y: Int)  -> Bool {
        if x > InputView.maxRange || x < InputView.minRange || y > InputView.maxRange || y < InputView.minRange  {
            return false
        }
        return true
    }
    
    func readInput() throws -> pair {
        printInputMessage()
        let (pointX, pointY) = try readInputUtil()
        return pair(pointX, pointY)
    }
    
}

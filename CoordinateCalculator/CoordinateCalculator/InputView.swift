//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by hw on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Pair = (x: Int, y: Int)


struct InputView {
    
    static private func printInputMessage(){
        print("(x,y) coordinate (ex; (2,5) ) > ")
    }
    
    static private func printLineInputMessage(){
        print("line (x1,y1)-(x2,y2) coordinate (ex; (2,5)-(4,10) ) > ")
    }
    
    static private func readEachPoint() throws -> String {
        guard let input = readLine() else {
            throw ErrorCode.InvalidInput
        }
        return input
    }
    
    static func readLineInput() throws -> [Pair] {
        printLineInputMessage()
        let inputString = try readEachPoint()
        let resultPairList = try InputRefinary(inputString).pointPair
        return resultPairList
    }
    
    static func readInput() throws -> [Pair] {
        printInputMessage()
        let inputString = try readEachPoint()
        let resultPair = try InputRefinary(inputString).pointPair
        return resultPair
    }
}

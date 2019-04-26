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
        print("좌표를 입력하세요. ")
    }
    
    static private func readEachPoint() throws -> String {
        guard let input = readLine() else {
            throw ErrorCode.InvalidInput
        }
        return input
    }
    
    static func readInput() throws -> [Pair] {
        printInputMessage()
        let inputString = try readEachPoint()
        let resultPair = try InputRefinary(inputString).pointPair
        return resultPair
    }
}

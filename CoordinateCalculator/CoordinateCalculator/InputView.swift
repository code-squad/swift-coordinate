//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by hw on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation



typealias Pair = (Int, Int)

struct InputView {
    
    private func printInputMessage(){
        print("(x,y) coordinate (ex; (2,5) ) > ")
    }
    
    private func readEachPoint() throws -> String {
        guard let input = readLine() else {
            throw ErrorCode.InvalidInput
        }
        return input
    }
    
    func readInput() throws -> Pair {
        printInputMessage()
        let inputString = try readEachPoint()
        let resultPair = try InputRefinary(inputString).pointPair
        return resultPair
    }
}

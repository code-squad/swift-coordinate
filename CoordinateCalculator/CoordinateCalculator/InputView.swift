//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 9..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {

    func readInput(_ message: String) -> String {
        print(message)
        let input = readLine()
        guard let inputCoodinates = input else { return "" }
        return inputCoodinates
    }

    //(10,10)-(20,20) "-" 기준으로 분리
    func makePoints(_ input: String) -> [MyPoint]? {
        var coordinates: [MyPoint] = []
        let temp = input.components(separatedBy: "-")
        for index in 0..<temp.count {
            coordinates.append(createPoint(separateComma(temp[index]))!)
        }
        return coordinates
    }

    //(10,10) "," 기준으로 분리
    private func separateComma(_ input: String) -> Array<String> {
        let coodinates = input.components(separatedBy: ",")
        return coodinates
    }

    private func createPoint(_ input: [String]) -> MyPoint? {
        guard let first = Int(input[0].dropFirst()), let last = Int(input[1].dropLast()) else { return nil }
        return MyPoint.init(x: first, y: last)
    }

}


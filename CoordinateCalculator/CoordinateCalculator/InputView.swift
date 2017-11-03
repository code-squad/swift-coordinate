//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var points: String = ""
    
    mutating func readInput() {
        print("좌표를 입력하세요.")
        let inputData = readLine()
        guard let points = inputData else {
            print("다시입력해주세요.")
            return
        }
        self.points = points
    }
    
    mutating func extract() throws -> MyPoint {
        var dotPoint: MyPoint = MyPoint()
        points.remove(at: points.startIndex)
        points.remove(at: points.index(before: points.endIndex))
        let separatePoint = points.components(separatedBy: ",").flatMap{ Int($0) }
        if confirm(points: separatePoint) {
            dotPoint.x = separatePoint[0]
            dotPoint.y = separatePoint[1]
            return dotPoint
        }
        throw InputViewError.invalidPoint
    }
    
    private func confirm(points: [Int]) -> Bool {
        if points.isEmpty {
            print("다시입력해주세요. 괄호안에는 정수가 와야합니다. :)")
            return false
        }
        for index in 0...1 {
            if points[index] < 0 || points[index] > 24 {
                print("x,y 값은 0 <= x,y <= 24 합니다. :) 다시입력해주세요.")
                return false
            }
        }
        return true
    }
    
}

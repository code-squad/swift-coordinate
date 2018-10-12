//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput() -> MyPoint {
        while true {
            print("좌표를 입력하세요. ex- (10,18) //단, 숫자의 최대 크기는 24")
            let xyPoint = getXYPoint(readLine() ?? "다시 입력해 주세요.")
            guard validCheck(xyPoint.x) && validCheck(xyPoint.y) else {continue}
            return xyPoint
        }
    }

    static private func getXYPoint(_ input:String) -> MyPoint {
        let xPoint = input.split(separator: "(")[0].split(separator: ",")[0]
        let yPoint = input.split(separator: ",")[1].split(separator: ")")[0]
        let xyPoint = MyPoint(x:Int(xPoint) ?? -1, y:Int(yPoint) ?? -1)
        return xyPoint
    }
    
    static private func validCheck(_ num:Int) -> Bool {
        return num >= 0 && num <= 24
    }
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static private let maxValue = ANSICode.axis.AxisLimit
    
    static private func readInput(ment:String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    static private func readPoint(isRepeat:Bool) -> MyPoint {
        let typingMent = "좌표를 입력하세요. //단, 숫자의 최대 크기는 24"
        let retypeMent = "숫자의 최대 크기는 24입니다. 입력값을 확인하시고 다시 입력 해주세요."
        let point = isRepeat == true ? readInput(ment: retypeMent) : readInput(ment: typingMent)
        return readXY(point)
    }
    
    static private func readXY(_ point:String) -> MyPoint {
        let xPoint = point.split(separator: "(")[0].split(separator: ",")[0]
        let yPoint = point.split(separator: ",")[1].split(separator: ")")[0]
        let xyPoint = MyPoint(x:Int(xPoint) ?? maxValue + 1, y:Int(yPoint) ?? maxValue + 1)
        return xyPoint
    }
    
    static func repeatRead() -> MyPoint {
        var isRepeat = false
        while true {
            let point = readPoint(isRepeat: isRepeat)
            guard validCheck(point: point) else {isRepeat = true ; continue}
            return point
        }
    }
    
    static private func validCheck(point:MyPoint) -> Bool {
        return point.x <= maxValue && point.y <= maxValue
    }
}

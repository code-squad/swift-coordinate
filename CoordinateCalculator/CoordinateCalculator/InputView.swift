//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static private let maxRange = ANSICode.axis.AxisLimit
    
    static private func readInput(ment:String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    static func readCoordinate(_ isRepeat:Bool) -> String {
        let typingMent = "좌표를 입력하세요. //단, 숫자의 최대 크기는 24"
        let retypeMent = "입력값을 확인하시고 다시 입력 해주세요."
        let coordinate = (isRepeat == true) ? readInput(ment: retypeMent) : readInput(ment: typingMent)
        return coordinate
    }
    
    static func readXY(_ coordinate:String) -> MyPoint {
        let x = coordinate.split(separator: "(")[0].split(separator: ",")[0]
        let y = coordinate.split(separator: ",")[1].split(separator: ")")[0]
        let xy = MyPoint(x:Int(x) ?? maxRange + 1, y:Int(y) ?? maxRange + 1)
        return xy
    }
}

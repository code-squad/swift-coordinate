//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() -> MyPoint {
        print("좌표를 입력하세요.")
        let xyPoint = getXYPoint(readLine()!)
        
        return xyPoint
    }

    private func getXYPoint(_ input:String) -> MyPoint {
        let xPoint = input.split(separator: "(")[0].split(separator: ",")[0]
        let yPoint = input.split(separator: ",")[1].split(separator: ")")[0]
        let xyPoint = MyPoint(x:Int(xPoint) ?? -1, y:Int(yPoint) ?? -1)
        return xyPoint
    }
    
}

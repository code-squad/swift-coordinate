//
//  File.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class PrintView {
    //row = y, col = x
    //변환에 쓰일 상수
    private let rowConstant = 25
    private let colConstant = 3
    
    // 출력을 위한 값으로 바꾸기
    private func modifyForPrint(point: MyPoint) -> (row: Int, col: Int) {
        let row = rowConstant - point.y
        let col = colConstant + point.x * 2
        return (row, col)
    }
    
    // ANSICode로 그리기
    func drawCoordinate(point: MyPoint) {
        let modifiedPoint = modifyForPrint(point: point)
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.text.yellowBright)\(ANSICode.cursor.move(row:modifiedPoint.row, col: modifiedPoint.col))•")
        print("\(ANSICode.cursor.move(row:26, col: 51))")
    }
    
    // 화면 지우기
    func eraseDisplay() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    
}

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
    //변환에 쓰일 기본값
    private let rowDefault = 25
    private let colDefault = 3
    
    // 출력을 위한 값으로 바꾸기
    private func fixForPrint(point: MyPoint) -> (row: Int, col: Int) {
        let row = rowDefault - point.y
        let col = colDefault + point.x * 2
        return (row, col)
    }
    
    // ANSICode로 그리기
    func drawCoordinate(point: MyPoint) {
        let fixedPoint = fixForPrint(point: point)
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.text.yellowBright)\(ANSICode.cursor.move(row:fixedPoint.row, col: fixedPoint.col))•")
        print("\(ANSICode.cursor.move(row:26, col: 51))")
    }
    
    // 화면 지우기
    func eraseDisplay() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    

}

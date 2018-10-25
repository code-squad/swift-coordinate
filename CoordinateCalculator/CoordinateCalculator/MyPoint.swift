//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Shape{
    private(set) var xPosition : Double
    private(set) var yPosition : Double
    
    init(_ xPosition: Double, _ yPosition: Double){
        self.xPosition = xPosition
        self.yPosition = yPosition
    }
    
    // Shape 프로토콜의 메소드를 구현한 메소드 화면상에 좌표를 그려준다
    func drawShape() {
        print("\(ANSICode.cursor.move(row: Int(25-yPosition), col: Int(2+2*xPosition)))*")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
    }
}

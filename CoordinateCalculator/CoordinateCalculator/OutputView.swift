//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    // 1사분면 좌표축을 그림
    func drawAxis() {
        print("\(ANSICode.text.black)\(ANSICode.axis.draw())")
    }
    
    // 입력한 포인트를 그림
    func drawPoint(point: MyPoint) {
        print("\(ANSICode.cursor.move(row: 25-point.yPosition, col: 2+2*point.xPosition))\(ANSICode.text.yellowBright)*")
        print("\(ANSICode.text.black)")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
    }
    
    // 그리기 전 터미널 화면 Clear
    func clearBackground() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

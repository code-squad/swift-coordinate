//
//  outputView.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// OutputView 구조체의 역할 : 좌표를 & 포인트를 출력
struct OutputView {
    private var first: (Int, Int)   // 첫 번째 좌표
    private var second: (Int, Int)  // 두 번째 좌표
    
    // 제 1사분면의 좌표 체계를 이용해서 입력받은 좌표를 변경
    init(points: (first: MyPoint, second: MyPoint)) {
        self.first = (24 - points.first.y, 2 * points.first.x + 3)
        self.second = (24 - points.second.y, 2 * points.second.x + 3)
    }
    
    // 좌표를 그리는 메소드
    public func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())\(ANSICode.text.whiteBright)")
    }
    
    // 원하는 포인트를 찍어주는 메소드
    public func markPoint() {
        print("\(ANSICode.cursor.move(row: first.0, col: first.1))\(ANSICode.text.whiteBright)*")
        print("\(ANSICode.cursor.move(row: second.0, col: second.1))\(ANSICode.text.whiteBright)*")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
    }
}

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
    private var point: [Int]
    
    init(point: [Int]) {
        self.point = point
    }
    
    // 좌표를 그리는 메소드
    public func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())\(ANSICode.text.whiteBright)")
    }
    
    // 원하는 포인트를 찍어주는 메소드
    public func markPoint() {
        print("\(ANSICode.cursor.move(row: point[0], col: point[1]))\(ANSICode.text.whiteBright)*")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
    }
}

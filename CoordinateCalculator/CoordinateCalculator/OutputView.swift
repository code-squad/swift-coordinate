//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 공명진 on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Cocoa

class OutputView {
    
    let point: Point
    
    init(point: Point) {
        self.point = point
    }
    
    func drawAll() {
        clearAxis()
        drawPoint(point: self.point)
        drawAxis()
    }
    
    /// 화면을 깨끗이 지우고 맨 위로 커서가 이동된다.
    private func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    /// x축, y축을 그린다.
    private func drawAxis() {
        print("\(ANSICode.axis.draw())")
    }
    
    /// 점을 그린 뒤, drawAxis 순으로 호출이 되어야 정상적인 drawing되고있다.
    private func drawPoint(point: Point) {
        let row = ANSICode.axis.AxisLimit + 1 - Int(point.y)
        let col = Int(point.x * 2 + 3)
        print("\(ANSICode.home)\(ANSICode.cursor.move(row: row, col: col))●")
    }
}

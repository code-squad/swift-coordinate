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
    private var figure: Figure
    
    // 제 1사분면의 좌표 체계를 이용해서 입력받은 좌표를 변경
    init(figure: Figure) {
        self.figure = figure
    }
    
    // 좌표를 그리는 메소드
    private func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())\(ANSICode.text.whiteBright)")
    }
    
    // 좌표를 아래로 내려서 사분면 전체를 보이게 해주는 메소드
    private func moveCursorClear() {
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
    }
    
    // 원하는 포인트를 찍어주는 메소드
    private func markPoint(_ point: MyPoint) {
        print("\(ANSICode.cursor.move(row: 24 - point.yPoint(), col: 2 * point.xPoint() + 3))\(ANSICode.text.whiteBright)*")
    }
    
    // 넘겨받은 좌표가 두 개인 경우 선을 출력해주는 메소드
    private func drawPoints(_ points: [MyPoint]) {
        for point in points {
            markPoint(point)
        }
    }
    
    private func printComputeResult(_ computable: ComputableFigure?) {
        guard let polygon = computable else {
            return
        }
        print("\(polygon.computeMent())\(polygon.compute())")
    }
    
    // 넘겨받은 좌표로 해당되는 도형을 출력해주는 메소드
    public func drawFigure() {
        drawAxis()
        drawPoints(figure.points)
        moveCursorClear()
        printComputeResult(figure as? ComputableFigure)
    }
}

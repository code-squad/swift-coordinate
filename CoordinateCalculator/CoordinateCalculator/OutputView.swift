//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static private func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    static func show(figure:Figure) {
        self.drawAxis()
        show(points: figure.readPoints())
        show(detailInfo: figure.readDetailInfo())
        
    }
    
    static private func show(points:[(Int,Int)]) {
        for point in points {
            print("\(ANSICode.cursor.move(row:point.1, col:point.0))🙈")
        }
    }
    
    static private func show(detailInfo:Double?) {
        if let info = detailInfo {
            print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit + 4, col:0))두 점 사이 거리는 \(info)")
        } else {
            print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit + 4, col:0))")
        }
    }
    
}

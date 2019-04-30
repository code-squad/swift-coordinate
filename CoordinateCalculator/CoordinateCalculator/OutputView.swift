//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    /// 좌표를 그리는 함수
    func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.blueBright)\(ANSICode.axis.draw())")
    }
    /// MyPoint, MyLine, MyTriangle, MyRect을 받아와서 출력하는 함수
    func printPoint(figure : Figure){
        for myPoint in figure.distinctIndex().myPoints {
            print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myPoint.y, col: (myPoint.x*2)+2))*")
        }
        print("\(ANSICode.cursor.move(row: 27, col: 25))")
    }
    
    func printGuide(guide: Guide){
        print("\(guide.guidePrint().ment) \(guide.guidePrint().value)")
    }
}

//
//  OutputView..swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis(_ drawThing:Drawable) {
        drawBoard()
        drawPoint(drawThing)
        printDistance(drawThing)
    }
    
    private static func drawBoard() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private static func drawPoint(_ mypoints:Drawable) {
        for point in mypoints.points {
            let x = point.x * 2 + 2
            let y = (ANSICode.axis.AxisLimit - point.y) + 1
            print("\(ANSICode.cursor.move(row: y, col: x))😼\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: ANSICode.axis.AxisLimit+2))")
        }
    }
    
    private static func printDistance(_ drawThing:Drawable) {
        if let line = drawThing as? hasDistance{
            print("두 점 사이의 거리: \(line.calculateDistance)")
        }
    }

}

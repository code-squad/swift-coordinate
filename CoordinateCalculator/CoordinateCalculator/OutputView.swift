//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JH on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func draw(shape: Drawable) {
        for point in shape.drawablePoints() {
            drawDot(at: point)
        }
    }

    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func drawDot(at value: MyPoint) {
        
        let startPoint = ANSICode.axis.AxisLimit + 1
        let x = value.x
        let y = value.y

        print("\(ANSICode.cursor.move(row: startPoint-y, col: (x*2)+2))😆\(ANSICode.cursor.move(row: startPoint+1, col: (startPoint*2)+2))")
    }
}

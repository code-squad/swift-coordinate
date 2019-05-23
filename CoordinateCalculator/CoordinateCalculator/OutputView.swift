//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis(){
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    static func clear(){
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func draw(point: MyPoint){
        print("\(ANSICode.cursor.move(row: 24-point.y+1, col: point.x*2+3))*")
    }
    
    static func draw(_ drawable: Drawable){
        clear()
        for point in drawable.points{
            draw(point: point)
        }
        drawAxis()
        guard let ex = drawable as? Explanation else { return }
        print(ex.explanation)
    }
}


//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    
    let point:MyPoint
    
    init(_ point:MyPoint) {
        self.point = point
    }
   
    
    func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.cyanBright)\(ANSICode.axis.draw())")
    }
    
    func drawPoint(){
        let row = ANSICode.convertX(self.point.x)
        let col = ANSICode.convertY(self.point.y)
        let color = ANSICode.text.colorFrom(R:255,G:127,B:0)
        print("\(ANSICode.cursor.move(row:row , col: col ))\(color)\(ANSICode.dot)")
        moveCurser()
    }
    func moveCurser(){
         print("\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: 2))")
    }
}

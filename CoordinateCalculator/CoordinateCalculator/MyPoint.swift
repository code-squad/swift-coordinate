//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Figure{

    private(set) var x = 0
    private(set) var y = 0
    

    
    init(_ point:PointTuple) {
      
        self.x = point.x
        self.y = point.y
    }
  
    func draw(point:MyPoint) {
        let row = ANSICode.convertX(point.x)
        let col = ANSICode.convertY(point.y)
        let color = ANSICode.text.colorFrom(R:255,G:127,B:0)
        print("\(ANSICode.cursor.move(row:row , col: col ))\(color)\(ANSICode.dot)")
        ANSICode.moveCurser()
    }
    
}

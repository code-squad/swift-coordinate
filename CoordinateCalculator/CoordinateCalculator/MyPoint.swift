//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Drawable{

    private(set) var x = 0
    private(set) var y = 0
    
    let possibleRange = 0...24
    
    init(_ point:PointTuple) throws {
        guard checkRange(point) else {
           throw Exception.ErrorType.outOfRange
        }
        self.x = point.x
        self.y = point.y
    }
    init(x:Int,y:Int) throws {
        try self.init(PointTuple(x,y))
    }
    
    private func checkRange(_ point:PointTuple)->Bool{
       return possibleRange.contains(point.x) && possibleRange.contains(point.y)
    }
    func draw() {
        let row = ANSICode.convertX(self.x)
        let col = ANSICode.convertY(self.y)
        let color = ANSICode.text.colorFrom(R:255,G:127,B:0)
        print("\(ANSICode.cursor.move(row:row , col: col ))\(color)\(ANSICode.dot)")
    }
    
    
}

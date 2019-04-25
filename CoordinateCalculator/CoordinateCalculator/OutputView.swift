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
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawPoint(){
        print("\(ANSICode.cursor.move(row:self.point.x, col: self.point.y))")
    }
}

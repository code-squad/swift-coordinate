//
//  CoordinateOutputView.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/20.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateOutputView {
    
    func print(shape: Shape) {
        Swift.print("\(ANSICode.clear)\(ANSICode.home)")
        shape.vertices.forEach {
            Swift.print("\(ANSICode.cursor.move(row:$0.coordinate.row, col: $0.coordinate.col))*")
        }
        Swift.print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        
        let distance = shape.distance()
        if distance > 0 {
            Swift.print("직선의 거리는:\(distance)")
        }
        
        let extent = shape.extent()
        if extent > 0 {
            Swift.print("도형의 넓이는:\(extent)")
        }
    }
}

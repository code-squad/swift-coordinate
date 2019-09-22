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
        
        if let description = shape.description {
            Swift.print(description)
        }
    }
}

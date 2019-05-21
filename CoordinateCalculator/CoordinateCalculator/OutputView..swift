//
//  OutputView..swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func drawAxis(_ point: MyPoint) {
        drawBoard()
        drawDot(point)
    }
    
    private func drawBoard() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private func drawDot(_ point:MyPoint) {
        
        print("\(ANSICode.cursor.move(row: point.y, col: point.x))😼\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: ANSICode.axis.AxisLimit+2))")
        
    }
    
}

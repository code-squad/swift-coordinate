//
//  OutputView..swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func drawAxis(_ drawThing: Drawable)throws {
        drawBoard()
        try drawOfRequest(drawThing)
    }
    
    private func drawBoard() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private func drawOfRequest(_ drawThing: Drawable)throws {
        if drawThing.pointNumber == 1 {
            let point = try downCastToMypoint(drawThing: drawThing)
            drawDot(point)
        }
        let line = try downCastToMyLine(drawThing: drawThing)
        drawLine(line)
        print("두 점 사이의 거리: \(line.calculateDistance)")
    }
    
    private func drawDot(_ point:MyPoint) {
        let x = point.x * 2 + 2
        let y = (ANSICode.axis.AxisLimit - point.y) + 1
        print("\(ANSICode.cursor.move(row: y, col: x))😼\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: ANSICode.axis.AxisLimit+2))")    }
    
    private func drawLine(_ line:MyLine) {
        let points = [line.pointA,line.pointB]
        for point in points {
            drawDot(point)
        }
    }
    
    private func downCastToMypoint(drawThing: Drawable)throws -> MyPoint {
        guard let point = drawThing as? MyPoint else{
            throw UserInputError.inCorrectFormat
        }
        return point
    }
    
    private func downCastToMyLine(drawThing: Drawable)throws -> MyLine {
        guard let line = drawThing as? MyLine else{
            throw UserInputError.inCorrectFormat
        }
        return line
    }

}

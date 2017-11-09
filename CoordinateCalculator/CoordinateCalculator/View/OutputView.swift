//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func draw(_ info: CoordinateModel) {
        var points = info.pointsAndResult.point
        print("\(ANSICode.clear)\(ANSICode.home)")
        
        func offsetPoint() {
            for pointsIndex in 0..<points.count {
                points[pointsIndex].x = (points[pointsIndex].x * 2) + 3
                points[pointsIndex].y = (points[pointsIndex].y - 25) * -1
                print("\(ANSICode.cursor.move(row: points[pointsIndex].y, col: points[pointsIndex].x))\(ANSICode.text.redBright)\u{00B7}")
            }
        }
        
        func drawAxis() {
            print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        }
        
        offsetPoint()
        drawAxis()
        printTrixInfo(info)
    }
    
    private func printTrixInfo(_ info: CoordinateModel) {
        switch info.generatrix {
        case .point:
            return
        case .line:
            print("두점사이의 거리 \(info.pointsAndResult.value ?? 0.0)")
        case .triangle:
            return 
        }
    }
    
}

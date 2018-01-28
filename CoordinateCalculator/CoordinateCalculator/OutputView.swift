//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public struct OutputView {
    
    func drawCoordinates(_ point: [MyPoint]) {
        clearAxis()
        for index in 0..<point.count {
            let pointCoordinate = calculateCoordinates(point[index])
            print("\(ANSICode.cursor.move(row: pointCoordinate.y, col: pointCoordinate.x))\(ANSICode.text.white)●")
        }
        drawAxis()
    }
    
    func calculateShape(_ point: [MyPoint]) {
        switch point.count {
        case 2:
            let line = MyLine(point)
            let distance = line.calculateDistance()
            print("두 점 사이의 거리는 \(distance)")
        case 3:
            let triangle = MyTriangle(point)
            let area = triangle.calculateArea()
            print("삼각형 넓이는 \(area)")
        case 4:
            let rect = MyRect(point)
            let area = rect.calculateArea()
            print("사각형 넓이는 \(area)")
        default:
            print("")
        }
    }
    
    func  calculateCoordinates(_ point: MyPoint) -> (x: Int, y: Int) {
        let x = point.x * 2 + 3
        let y = (point.y - 25) * -1
        return (x, y)
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
}



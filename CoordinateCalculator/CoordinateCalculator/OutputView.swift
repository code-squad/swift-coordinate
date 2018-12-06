//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawShape(_ shape: FigureProtocol){
        drawPoint()
        for point in shape.points {
            resultPoint(inputPoints: point)
        }
        if shape.points.count >= 2 {
            displayLine(shape as! DistanceProtocol)
        }
        drawEnd()
    }
    
    private func resultPoint(inputPoints : MyPoint) {
        let xPoint = inputPoints.x * 2 + 3
        let yPoint = (inputPoints.y - 25) * -1
        print("\(ANSICode.cursor.move(row : yPoint, col : xPoint))\(ANSICode.text.yellowBright)•")
    }
    
    private func drawPoint() {
        clearConsole()
        drawAxis()
    }
    private func drawEnd(){
        print(ANSICode.cursor.move(row: 29, col: 3))
    }
    
    private func displayLine(_ value: DistanceProtocol){
        print(ANSICode.cursor.move(row: 27, col: 3))
        print("\(value.descriptionTwoPoint) \(value.valueOfPoint)")
    }
    
    private func drawAxis() {
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        
    }
    
    private func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

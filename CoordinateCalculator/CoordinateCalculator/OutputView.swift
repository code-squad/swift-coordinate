//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func resultPoint(inputPoints : MyPoint) {
        let xPoint = inputPoints.x * 2 + 3
        let yPoint = (inputPoints.y - 25) * -1
        print("\(ANSICode.cursor.move(row : yPoint, col : xPoint))\(ANSICode.text.yellowBright)•")
    }
    
    func drawPoint() {
        clearConsole()
        drawAxis()
    }
    func drawEnd(){
        print(ANSICode.cursor.move(row: 28, col: 3))
    }
    
    func displayLine(_ line: MyLine){
        print(ANSICode.cursor.move(row: 27, col: 3))
        print(line.resultDescription)
        
    }
    
    func drawAxis() {
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

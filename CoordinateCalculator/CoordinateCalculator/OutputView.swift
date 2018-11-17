//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func resultPoint(inputPoints : MyPoint) -> String {
        let xPoint = inputPoints.x * 2 + 3
        let yPoint = (inputPoints.y - 25) * -1
        var result = ANSICode.cursor.move(row : yPoint, col : xPoint)
        result += (ANSICode.text.yellowBright)
        result += "•"
        return result
    }
    
    func drawPoint(_ point: String,_ line: String) {
        clearConsole()
        drawAxis()
        print(point)
        
        if(line != "") {
            print(line)
        }
        print(ANSICode.cursor.move(row: 27, col: 3))
    }
    
    // 아래 두점사이거리 출력
    func displayLine(_ line: MyLine) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: 27, col: 3)
        result += line.resultDescription
        return result
    }
    
    private func drawAxis() {
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    private func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

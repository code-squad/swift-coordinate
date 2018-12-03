//
//  OutputView.swift
//  coordinateCalculator
//
//  Created by JINA on 29/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

struct outputView {
    //좌표를 그려줌
    func printMyPoint(_ input: [String]) { 
        let point = InputView.separateValue(input)
        let x = point.x * 2 + 3
        let y = 25 - point.y
        clear()
        print("\(ANSICode.cursor.move(row: y, col: x))\(ANSICode.text.redBright)●")
        printAxis()
    }
    
    //화면을 지우고 좌표축을 그려줌
    private func printAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    private func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}




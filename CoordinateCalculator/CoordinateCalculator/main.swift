//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct Main {
    static func start(){
        while true {
            guard let point = InputView.read() else { continue }
            if point.count == 1 {
                let myPoint = point.map {MyPoint(x: $0.x, y: $0.y)}
                OutputView.drawAxis(with: myPoint)
            }else if point.count == 2 {
                let myLine = MyLine(points: point.map {MyPoint(x: $0.x, y: $0.y)})
                OutputView.drawAxis(with: myLine)
            }
            break
        }
    }
}

Main.start()

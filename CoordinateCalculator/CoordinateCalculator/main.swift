//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// coordinates 개수에 따라 분류하는 함수
private func selectShape(coordinates:[MyPoint]) -> Bool {
    switch coordinates.count {
    case 1: // point
        let valueX = coordinates[0].valueX
        let valueY = coordinates[0].valueY
        OutputView.drawAxis()
        let point = MyPoint.init(x: valueX, y: valueY)
        OutputView.printCoordinateMyPoint(point: point)
        return false
    case 2: // line
        let valueX = coordinates[0]
        let valueY = coordinates[1]
        OutputView.drawAxis()
        let point = MyLine.init(pointA: valueX, pointB: valueY)
        OutputView.printCoordinateMyLine(line: point)
        return false
    default:
        /*
         좌표값 범위를 넘거나 입력할 수 없는 문자가 포함된 경우 빈값을 리턴받아 해당 부분에 들어옵니다.
         또한, 원하는 값 이상으로 좌표가 입력된 경우에도 해당 부분으로 들어옵니다.
         */
        return true
    }
}

public func main() -> Bool {
    let initValue = InputView.readInput()
    
    guard let inputValue = InputView.checkEmpty(value: initValue) else { return true }
    
    let coordinates:[MyPoint] = InputView.changeShape(value: inputValue)
    let result = selectShape(coordinates: coordinates)
    
    return result
}

var play:Bool = true
while play {
    play = main()
}

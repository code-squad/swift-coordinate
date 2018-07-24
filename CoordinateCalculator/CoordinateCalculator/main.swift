//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

public func main() {
    print("좌표를 입력하세요.")
    let input:String? = readLine()
    
    guard let inputValue = input else { return main() }
    if inputValue.isEmpty {
        print("값이 비어있습니다. 다시 입력해주세요.")
        return main()
    }
    
    let coordinates:[MyPoint] = InputView.readInput(input: inputValue)
    
    switch coordinates.count {
    case 1: // point
        let valueX = coordinates[0].valueX
        let valueY = coordinates[0].valueY
        let point = MyPoint.init(x: valueX, y: valueY)
        OutputView.drawAxis()
        OutputView.printCoordinateMyPoint(point: point)
    case 2: // line
        let valueX = coordinates[0]
        let valueY = coordinates[1]
        let point = MyLine.init(pointA: valueX, pointB: valueY)
        OutputView.drawAxis()
        OutputView.printCoordinateMyLine(line: point)
    default:
        /*
         좌표값 범위를 넘거나 입력할 수 없는 문자가 포함된 경우 빈값을 리턴받아 해당 부분에 들어옵니다.
         또한, 원하는 값 이상으로 좌표가 입력된 경우에도 해당 부분으로 들어옵니다.
         */
        return main()
    }
}


main()

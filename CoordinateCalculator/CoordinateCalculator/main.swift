//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let coordinate:Array<Int> = InputView.readInput()
    guard let valueX = coordinate.first , let valueY = coordinate.last else {
        print("입력값을 다시 입력하세요.")
        return main()
    }
    let point:MyPoint = MyPoint.init(x: valueX, y: valueY)
    
    // 좌표 기본 그리기
    OutputView.drawAxis()
    // 좌표 표시하기
    OutputView.printCoordinate(point: point)
    
}


main()

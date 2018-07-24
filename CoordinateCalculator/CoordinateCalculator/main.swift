//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    print("좌표를 입력하세요.")
    let input:String? = readLine()
    guard let inputValue = input else {
        print("입력값이 비어 있습니다. 다시 입력하세요.")
        return main()
    }
    let coordinate:Array<Int> = InputView.readInput(input: inputValue)
    guard let valueX = coordinate.first , let valueY = coordinate.last else {
        print("입력값을 다시 입력하세요.")
        return main()
    }
    let point = MyPoint.init(x: valueX, y: valueY)
    
    // 좌표 기본 그리기
    OutputView.drawAxis()
    // 좌표 표시하기
    OutputView.printCoordinate(point: point)
    
}


main()

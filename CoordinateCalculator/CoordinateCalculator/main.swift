//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let input = InputView.readInput(question: "좌표를 입력하세요. ex.(10,10)")
    let point = InputControl.convertStringtoInt(input: input)
    OutputView.drawAxis(point: point)
}

main()

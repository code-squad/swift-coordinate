//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let inputValue = InputView(mention: "좌표를 입력해주세요.").readInput()
    
    OutputView.drawAxis()
}

main()

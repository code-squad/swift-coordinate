//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() -> Bool {
    
    let rawValue = InputView(mention: "좌표를 입력하세요.").readInput()
    if !InputCheck().isPass(rawValue) {
        return false
    }
    
    let myPoint = MyPoint(point: rawValue)
    
    
    
    return true
}

while(false) {
    main()
}

//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

public func main() -> Bool {
    let initValue = InputView.readInput()
    
    guard let inputValue = InputView.checkEmpty(value: initValue) else { return true }
    
    let coordinates:[MyPoint] = InputView.changeShape(value: inputValue)
    let result = OutputView.selectShape(coordinates: coordinates)
    
    return result
}

var play:Bool = true
while play {
    play = main()
}

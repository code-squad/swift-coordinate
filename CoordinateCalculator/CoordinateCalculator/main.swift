//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView = InputView()
let checking = CheckingInput()
let outputView = OutputView()
let factoryPoint = FactoryMyPoint()
let factoryShape = FactoryShape()

var myShape : MyShape
var myPoints : [MyPoint]
let userInput = inputView.readInput()

do {
    let checkedInput = try checking.checkError(checking.checkPointNums(userInput))
    myPoints = factoryPoint.makeMyPoint(checkedInput)
    myShape = factoryShape.makeShape(myPoints)
    
    outputView.drawClear()
    outputView.drawPoint(myShape)
    outputView.drawAxis()
} catch let error as CheckingInput.ErrorCase {
    print (error.rawValue)
}


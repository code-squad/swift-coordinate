//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView = InputView()
let inputChecker = InputChecker()
let outputView = OutputView()
let factoryPoint = FactoryMyPoint()
let factoryShape = FactoryMyShape()
let shapeChecker = ShapeChecker()

var myShape : MyShape!
var myPoints : [MyPoint]
var gameIsEnd = true

while gameIsEnd {
    let userInput = inputView.readInput()
    do {
        let checkedInput = try inputChecker.validateInput(userInput)
        let checkedPoints = try inputChecker.filterValidPoints(checkedInput)
        myPoints = factoryPoint.makeMyPoint(checkedPoints)
        myShape = try shapeChecker.validShape(factoryShape.makeShape(myPoints))
        gameIsEnd = false
    } catch let error as ErrorType.InputCase {
        print (error.rawValue)
    } catch let error as ErrorType.ShapeCase {
        print (error.rawValue)
    }
}
outputView.drawClear()
outputView.drawAxis()
outputView.drawPoint(myShape)

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
var myPoints : [MyPoint]!
var gameIsEnd = true

while gameIsEnd {
    let userInput = inputView.readInput()
    if userInput == "quit" {
        print("=== 게임 종료 ===")
        break
    }
    do {
        let checkedInput = try inputChecker.validateInput(userInput)
        let checkedPoints = try inputChecker.filterValidPoints(checkedInput)
        myPoints = factoryPoint.makeMyPoint(checkedPoints)
        myShape = try shapeChecker.validShape(factoryShape.makeShape(myPoints))
    } catch let error as InputChecker.InputCase {
        print (error.rawValue)
        continue
    } catch let error as ShapeChecker.ShapeCase {
        print (error.rawValue)
        continue
    }
    outputView.drawClear()
    outputView.drawAxis()
    outputView.drawPoint(myShape)
    gameIsEnd = false
}


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
let factoryShape = FactoryMyShape()

var myShape : MyShape!
var myPoints : [MyPoint]
var gameIsEnd = true

while gameIsEnd {
    let userInput = inputView.readInput()
    do {
        let checkedInput = try checking.checkUserInput(userInput)
        let checkedPoints = try checking.checkEachPoints(checkedInput)
        myPoints = factoryPoint.makeMyPoint(checkedPoints)
        myShape = factoryShape.makeShape(myPoints)
        gameIsEnd = false
    } catch let error as CheckingInput.ErrorCase {
        print (error.rawValue)
    }
}
outputView.drawClear()
outputView.drawAxis()
outputView.drawPoint(myShape)

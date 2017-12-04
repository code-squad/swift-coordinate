//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView = InputView()
var gameIsEnd = true

while gameIsEnd {
    let userInput = inputView.readInput()
    if userInput == "quit" {
        print("=== 게임 종료 ===")
        break
    }
    
    let checkedPoints : [(Int,Int)]
    do {
        let inputChecker = InputChecker()
        checkedPoints = try inputChecker.validInput(userInput)
    } catch let error as InputChecker.InputError {
        print (error.rawValue)
        continue
    }
    
    var myPoints : [MyPoint]!
    do {
        let factoryPoint = FactoryMyPoint()
        myPoints = try factoryPoint.makeMyPoint(checkedPoints)
    } catch let error as FactoryMyPoint.PointError {
        print (error.rawValue)
        continue
    }
    
    var myShape : MyShape!
    do {
        let factoryShape = FactoryMyShape()
        myShape = try factoryShape.makeShape(myPoints)
    } catch let error as FactoryMyShape.ShapeError {
        print (error.rawValue)
        continue
    }
    
    let outputView = OutputView()
    outputView.drawClear()
    outputView.drawAxis()
    outputView.drawPoint(myShape)
    gameIsEnd = false
}


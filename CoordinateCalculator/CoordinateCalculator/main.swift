//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    
    var userInput = String()
    let inputChecker = InputChecker()
    
    userInput = InputView.readInput(question: Question.coordinate.rawValue)    
    let splited: [String] = inputChecker.splitByHyphen(in: userInput)
    let coordinates: [[Int]] = inputChecker.getCoordinateFrom(textCoordinates: splited)
    let myPoints: [MyPoint] = inputChecker.makeMyPoint(coordinates)
    
    let figureFactory = FigureFactory(myPoints)
    let figure = figureFactory.makeFigure()
    
    let figureInformation = FigureInformation(figure: figure, distance: figure.calculateDistance(), point: myPoints)
}

main()



//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Points = [(x: Int, y: Int)]

let inputView = InputView()
let points = inputView.readInput()

let figureCreator = FigureCreator()
let figure = figureCreator.createFigure(points: points)

let outputView = OutputView(figure: figure)
outputView.drawAll()


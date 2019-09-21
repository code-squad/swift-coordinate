//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


let controller = UserInputController()
let coordinates = controller.readCoordinates()

let outputView = CoordinateOutputView(coordinates: coordinates)
outputView.printCoordinates()

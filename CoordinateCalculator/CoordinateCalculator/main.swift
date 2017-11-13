//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while(true) {
    do {    
        try OutputView.moveCoordinates(in: InputView().readInput())
    } catch let error as CoordinatesError {
        print(error.description)
    }
}





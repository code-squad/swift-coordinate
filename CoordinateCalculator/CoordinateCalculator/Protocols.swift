//
//  FigureProtocol.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    var myPoints: [MyPoint] { get }
}

protocol FigureCalculatable {
    func calculateDistance() -> Double
    func printDistance()
}

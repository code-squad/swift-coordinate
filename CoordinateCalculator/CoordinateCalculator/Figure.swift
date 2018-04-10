//
//  FigureProtocol.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    func calculateDistance() -> Double
    var myPoints: [MyPoint] { get }
    func printDistance()
}

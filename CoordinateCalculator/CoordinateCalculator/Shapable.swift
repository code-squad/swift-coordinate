//
//  ShapeByPoints.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

//typealias XYPosTuple = (xPos: Int, yPos: Int)
//protocol Point {
//    var point : (xPos: Int, yPos: Int) { get }
//}

typealias Point = (xPos: Int, yPos: Int)

protocol Shapable {
    func pointToShow() -> [Point]
    func shapeDependentResult() -> String    
}

//
//  ShapeByPoints.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Point = (xPos: Int, yPos: Int)

protocol Shapable {
    func pointToDraw() -> [PointDrawable]
    //func shapeDependentResult() -> String
    func shapeDependentResult(display: (Shapable, String, Any) -> ())
}

protocol PointDrawable {
    var xDrawable: Int { get }
    var yDrawable: Int { get }
}

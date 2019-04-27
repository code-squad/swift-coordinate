//
//  ShapeCreatable.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol ShapeCreatable {
    static func createShape(pointList: [Pair]) throws -> Shapable
}

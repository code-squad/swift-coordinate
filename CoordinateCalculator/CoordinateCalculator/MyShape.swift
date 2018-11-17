//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Elena on 17/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol pointProtocol {
    var points: [MyPoint] { get }
    var pointsForPosition: [MyPoint] { get }
}

protocol twoPointProtocol {
    var resultDescription: String { get }
}

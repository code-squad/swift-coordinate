//
//  Point.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape{
    var points:[MyPoint] { get }
}

protocol Resultable {
    func result() -> String
}

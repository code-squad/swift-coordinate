//
//  AxisDrawable.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol AxisDrawable {
    var points: [MyPoint] { get }
}

protocol ValueComputable {
    var description: String { get }
    func getComputedValue() -> Double
}

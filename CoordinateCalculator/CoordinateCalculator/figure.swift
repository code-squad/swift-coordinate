//
//  figure.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 25/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    var points: [MyPoint] { get }
    func calculate() -> Double?
}

//
//  Calculable.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Calculable{
    var explanation: String { get }
    func getCalculatedValue()->Double
}


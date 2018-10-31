//
//  Computable.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 31..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Computable {
    func square(of number: Int) -> Double
}

extension Computable {
    func square(of number: Int) -> Double {
        return Double(number * number)
    }
}

//
//  Calculable.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Calculable {
    
    var description: String { get }
    
    func getCalcultedValue() -> Double
    
}

//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 28..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyShape {
    
    func drawPoint() -> [MyPoint]
    
    func calculate() -> (String, Double)
    
}


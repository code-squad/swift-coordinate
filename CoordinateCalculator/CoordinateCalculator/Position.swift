//
//  Position.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 24/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Position {
    private(set) var xPosition: Double
    private(set) var yPosition: Double
    
    init(_ xPosition: Double, _ yPosition: Double){
        self.xPosition = xPosition
        self.yPosition = yPosition
    }
}

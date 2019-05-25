//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by JH on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: DrawableShape {
   
    var x: Int
    var y: Int
    
    func drawablePoints() -> [MyPoint] {
        return [self]
    }
    
}

//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by JH on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Drawable {
   
    var x: Int
    var y: Int
    
    func drawablePoint() -> [MyPoint] {
        return [self]
    }
    
}

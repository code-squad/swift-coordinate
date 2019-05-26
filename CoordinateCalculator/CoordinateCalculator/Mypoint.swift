//
//  Mypoint.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint:Drawable {
    var pointNumber: Int = 1
    var x = 0
    var y = 0
    
    init(x:Int,y:Int) {
        self.x = x
        self.y = y
    }
}

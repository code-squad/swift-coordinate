//
//  Mypoint.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint:Drawable {
    private(set) var x = 0
    private(set) var y = 0
    
    var points:[MyPoint] {
        return [self]
    }
    
    init(x:Int,y:Int) {
        self.x = x
        self.y = y
    }
}

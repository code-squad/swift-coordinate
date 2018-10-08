//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
    
    init(x:String, y:String) {
        guard let x = Int(x) else { return }
        guard let y = Int(y) else { return }
        if (x > 24 || y > 24) { return }
        self.x = x
        self.y = y
    }
}

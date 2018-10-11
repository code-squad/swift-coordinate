//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var x = 0
    private(set) var y = 0
    
    init(x:String, y:String) {
        guard let x = Int(x) else { return }
        guard let y = Int(y) else { return }
        self.x = x
        self.y = y
    }
}

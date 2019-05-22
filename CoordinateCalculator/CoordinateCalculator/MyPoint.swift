//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Drawable,Hashable {
    var points: [MyPoint] {
        return [self]
    }
    
    var x = 0
    var y = 0
}

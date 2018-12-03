//
//  MyPoint.swift
//  coordinateCalculator
//
//  Created by JINA on 29/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

//입력받은 값 처리

struct MyPoint {
    var x = 0
    var y = 0
    
    init(_ input:[Int]) {
        self.x = input[0]
        self.y = input[1]
    }
}

//
//  MyPoint.swift
//  coordinateCalculator
//
//  Created by JINA on 29/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

//입력받은 값 처리
struct MyPoint: Figure {
    private(set) var x: Int
    private(set) var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var point: [MyPoint] {
        return [self]
    }
}

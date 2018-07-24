//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private (set) var x: Int = 0
    private (set) var y: Int = 0
    
    var drawForm: MyPoint {
        return MyPoint(x: 2*x + 3, y: 25 - y)
    }
    
    private init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init?(x: String, y: String) {
        guard let x = Int(x) else { return nil }
        guard let y = Int(y) else { return nil }
        
        if x > 24 || y > 24 {
            print("좌표 값의 최대 값은 24입니다.")
            return nil
        }
        self.init(x: x, y: y)
    }
}

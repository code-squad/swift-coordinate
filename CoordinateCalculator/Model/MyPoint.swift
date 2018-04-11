//
//  Model.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// MyPoint 저장 변수 Private(set) 으로 setter만 private로 선언
struct MyPoint: Equatable {
    private(set) var x: Int = 0
    private(set) var y: Int = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ mypoint: MyPoint) {
        self = mypoint
    }
    
}


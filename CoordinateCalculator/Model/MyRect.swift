//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: Equatable {
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
    }
}

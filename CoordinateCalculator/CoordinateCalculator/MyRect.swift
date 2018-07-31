//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private var leftTop: MyPoint
    private var rightBottom: MyPoint
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y + Int(size.height))
    }
}

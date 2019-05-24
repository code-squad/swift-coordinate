//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 24..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private let leftTop: MyPoint
    private let rightBottom: MyPoint
    
    init?(origin: MyPoint, size: CGSize) {
        guard size.width > 0 || size.height > 0 else {
            return nil
        }
        self.leftTop = MyPoint(x: origin.x, y: origin.y + Int(size.height))
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y)
    }
}

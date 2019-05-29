//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 29/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect:Drawable,HasArea {
    
    var points:[MyPoint]
    
    private let rightTop: MyPoint
    private let leftBottom: MyPoint
    
    var calculateArea:Double {
        let width = rightTop.x - leftBottom.x
        let height = rightTop.y - leftBottom.y
        return Double(width * height)
    }
    
    init(origin: MyPoint, size: CGSize, points:[MyPoint]) {
        self.leftBottom = origin
        self.rightTop = MyPoint(x:origin.x + Int(size.width), y:origin.y + Int(size.height))
        self.points = points
    }
    
}

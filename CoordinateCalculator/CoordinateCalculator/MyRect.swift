//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct MyRect {
    private var leftTop : MyPoint!
    private var rightBottom : MyPoint!
    
    init(leftTop: MyPoint, rightBottom: MyPoint) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.init(leftTop: origin, rightBottom: MyPoint(x: origin.X + Int(size.width), y: origin.Y - Int(size.height)))
    }
    
    func area() -> Int {
        let width = rightBottom.X - leftTop.X
        let height = leftTop.Y - rightBottom.Y
        
        return width *  height
    }
}

extension MyRect : Shapable {
    func pointToShow() -> [Point] {
        var rectPoints = Array<Point>()
        
        rectPoints.append(leftTop.pointToShow()[0])
        rectPoints.append(rightBottom.pointToShow()[0])
        rectPoints.append(MyPoint(x: leftTop.X, y: rightBottom.Y).pointToShow()[0])
        rectPoints.append(MyPoint(x: rightBottom.X, y: leftTop.Y).pointToShow()[0])
        
        return rectPoints
    }
    
    func shapeDependentResult() -> String {
        let area = self.area()
        
        return "사각형의 넓이는 \(area)"
    }
    
}

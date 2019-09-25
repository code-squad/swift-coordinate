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
    func pointToDraw() -> [PointDrawable] {
        
        let drawableLeftTop = leftTop.pointToDraw()[0]
        let drawableRightBottom = rightBottom.pointToDraw()[0]
        let drawableRightTop = MyPoint(x: rightBottom.X, y: leftTop.Y).pointToDraw()[0]
        let drawableLeftBottom = MyPoint(x: leftTop.X, y: rightBottom.Y).pointToDraw()[0]
        
        return [drawableLeftTop, drawableRightTop, drawableRightBottom, drawableLeftBottom]
    }
    
    func shapeDependentResult(display: (Shapable, String, Any) -> ()) {
        let area = self.area()
        
        display(self, "사각형의 넓이는 ", area)
    }
    
}

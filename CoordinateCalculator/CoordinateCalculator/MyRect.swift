//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by hw on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : Shapable {    
    
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    
    private var origin = MyPoint()
    private var cgSize = CGSize(width: 1, height: 1)
    private var width: Double = 0
    private var height: Double = 0
    
    var shapeInformation: Double {
        get{
            return width * height
        }
    }
    var questionMessage: String {
        get{
            return "사각형의 넓이는 "
        }
    }
    private mutating func setWidthAndHeight(){
        width = Double(rightBottom.y - leftTop.y)
        height = Double(leftTop.x - rightBottom.x)
    }
    
    private mutating func setOrigin(leftTop: MyPoint, rightBottom: MyPoint){
        let originX = ( leftTop.x + rightBottom.x ) / 2
        let originY = ( leftTop.y + rightBottom.y ) / 2
        origin = MyPoint(x: originX, y: originY)
    }
    
    init(leftTop: MyPoint, rightBottom: MyPoint){
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        setOrigin(leftTop: leftTop, rightBottom: rightBottom)
        setWidthAndHeight()
    }
    
    init(origin: MyPoint, size: CGSize) {
        self.origin = origin
        self.cgSize = size
    }
    
    func getDrawablePointList() -> [MyPoint] {
        var pointList: [MyPoint]  = [MyPoint]()
        let leftBottom = MyPoint.init(x: leftTop.x, y: rightBottom.y)
        let rightTop = MyPoint.init(x: rightBottom.x, y: leftTop.y)
        pointList.append(self.leftTop)
        pointList.append(self.rightBottom)
        pointList.append(leftBottom)
        pointList.append(rightTop)
        return pointList
    }
}

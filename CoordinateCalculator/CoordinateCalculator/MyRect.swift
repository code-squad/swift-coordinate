//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by hw on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : TwoDimensionable {
    
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    
    private var _origin = MyPoint()
    private var _cgSize = CGSize(width: 1, height: 1)
    private var _area: Double = 0
    private var _width: Double = 0
    private var _height: Double = 0
    
    var shapeInformation: Double {
        get{
            return _area
        }
    }
    var description: String {
        get{
            return "사각형의 넓이는 "
        }
    }
    private mutating func setArea(){
        _width = Double(rightBottom.y - leftTop.y)
        _height = Double(leftTop.x - rightBottom.x)
        self._area = _width * _height
    }
    
    private mutating func setOrigin(leftTop: MyPoint, rightBottom: MyPoint){
        let originX = ( leftTop.x + rightBottom.x ) / 2
        let originY = ( leftTop.y + rightBottom.y ) / 2
        _origin = MyPoint(x: originX, y: originY)
    }
    
    init(leftTop: MyPoint, rightBottom: MyPoint){
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        setOrigin(leftTop: leftTop, rightBottom: rightBottom)
        setArea()
    }
    
    init(origin: MyPoint, size: CGSize) {
        _origin = origin
        _cgSize = size
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

//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : HaveTraitShape {
    private(set) var leftTop : MyPoint
    private(set) var rightBottom : MyPoint
    private(set) var size : CGSize
    
    init(origin: MyPoint, size: CGSize){
        self.leftTop = origin
        self.size = size
        let rbPositionX : Double = origin.xPosition + Double(size.width)
        let rbPositionY : Double = origin.yPosition - Double(size.height)
        self.rightBottom = MyPoint(rbPositionX, rbPositionY)
    }
    
    // 사각형의 넓이 계산
    func calculateShapeTrait() -> Double {
        return Double(self.size.height) * Double(self.size.width)
    }
    
    func getMessage() -> String {
        return "사각형의 넓이는 "
    }
    
    func getPoint() -> [MyPoint] {
        let leftBottom : MyPoint = MyPoint(self.leftTop.xPosition, self.rightBottom.yPosition)
        let rightTop : MyPoint = MyPoint(self.rightBottom.xPosition, self.leftTop.yPosition)
        return [leftBottom, leftTop, rightBottom, rightTop]
    }
}

//
//  MyRect+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 17..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

extension MyRect: FigureProtocol {
    func figureCalculation() -> Double {
        return Double((rightBottom.x - leftTop.x) * (leftTop.y - rightBottom.y))
    }
    
    var description: String {
        return "사각형 넓이는 "
    }
    
    func getPoints() -> [MyPoint] {
        let leftBottom = MyPoint(x: self.leftTop.x, y: self.rightBottom.y)
        let rightTop = MyPoint(x: self.rightBottom.x, y: self.leftTop.y)
        
        return [leftBottom, leftTop, rightBottom, rightTop]
    }
    
    
}

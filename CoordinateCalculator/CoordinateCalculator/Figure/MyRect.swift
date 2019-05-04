//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 05/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect :Figure,Calculable{
    
    private (set) var leftTop:MyPoint
    private (set) var rightBottom:MyPoint
    
    func getPoints() -> [MyPoint] {
        let rightTop = MyPoint.init((x:rightBottom.x,y:leftTop.y))
        let leftBottom = MyPoint.init((x:rightBottom.x,y:leftTop.y))
        return [leftTop,rightTop,leftBottom,rightBottom]
    }
    
    var explanation: String = "사각형의 넓이는 "
    
    func getCalculatedValue() -> Double {
        return 10.0
    }
   
    
}

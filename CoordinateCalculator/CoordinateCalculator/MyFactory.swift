//
//  MyFactory.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyFactory {
    
    func makePoint(_ myPoint: [MyPoint]) -> MyShape {
        var point: MyShape
        switch myPoint.count {
        case 2:
            point = MyLine.init(myPoint)
        case 3:
            point = MyTriangle.init(myPoint)
        case 4:
            point = MyRect.init(myPoint)
        default:
            point = myPoint[0]
        }
        return point
    }

}

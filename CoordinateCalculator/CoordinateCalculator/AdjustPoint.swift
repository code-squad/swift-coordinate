//
//  AdjustPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

//MyPoint값을 출력을 위해 조정하고 MyPointOutput을 리턴
struct AdjustPoint {
    
    func adjusting (_ myPoint: MyPoint) -> MyPointOutput {
        var outPutX = 0
        var outPutY = 0
        
        outPutX = (myPoint.x * 2) + 3
        outPutY = 25 - myPoint.y
        
        return MyPointOutput(x: outPutX, y: outPutY)
    }
    
    
}

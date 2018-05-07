//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Points{
    // 좌표값
    var x = 0
    var y = 0
    init(x:Int,y:Int){
        self.x=x
        self.y=y
    }
    
    /// 프로토콜을 준수
    func getPoints() -> [MyPoint] {
        return [self]
    }
}

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
    private var x = 0
    private var y = 0
    // 생성자
    init(x:Int,y:Int){
        self.x=x
        self.y=y
    }
    
    /// 외부에서 좌표값을 얻기 위한 함수
    func getXAxis()->Int{
        return self.x
    }
    func getYAxis()->Int{
        return self.y
    }
    
    
    /// 프로토콜을 준수
    func getPoints() -> [MyPoint] {
        return [self]
    }
    func getMessage() -> String {
        return ""
    }
}

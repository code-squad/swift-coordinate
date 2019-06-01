//
//  Check.swift
//  CoordinateCalculator
//
//  Created by JH on 31/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct Check {
    
    func check(coordinates: [(x: Int, y: Int)]) -> Bool {
        // 좌표값이 4개가 아니면 실패, 4개면 다음코드블럭으로 넘어간다.
        guard coordinates.count == 4 else {
            return false
        }
        
        var xValues : Set<Int> = []
        var yValuse = Set<Int>()
        
//        for index in 0 ..< coordinates.count {
//            xValues.insert(coordinates[index].x)
//            yValuse.insert(coordinates[index].y)
//        }
        //좌표값배열요소 하나씩 접근해서 set타입의 변수에 넣어준다.
        for coordinate in coordinates {
            xValues.insert(coordinate.x)
            yValuse.insert(coordinate.y)
        }
        // 변수에 원소 갯수가 2개면 참, 아니면 거짓을 리턴한다.
        if xValues.count == 2 && yValuse.count == 2 {
            return true
        }
        return false
    }
    
}

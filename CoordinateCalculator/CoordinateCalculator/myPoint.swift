//
//  coordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    // 제 1사분면의 좌표 체계를 이용해서 입력받은 좌표를 변경
    init(point: [Int]) {
        self.x = 25 - point[1]
        self.y = 2 * point[0] + 3
    }
}

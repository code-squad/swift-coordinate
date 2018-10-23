//
//  CreatePoint.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeCreator{
    // Point를 생성해서 리턴해줌
    static func createPoint(xyPosition: String) -> MyPoint?{
        let xyPosition : [String] = xyPosition.components(separatedBy: ["(", ")", ","])
        guard let xPosition = Int(xyPosition[1]) else {return nil}
        guard let yPosition = Int(xyPosition[2]) else {return nil}
        return MyPoint(xPosition: xPosition, yPosition: yPosition)
    }
}

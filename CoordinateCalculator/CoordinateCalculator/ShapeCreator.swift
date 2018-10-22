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
    static func createPoint(xPosition: String, yPosition: String) -> MyPoint?{
        guard let xPosition = Int(xPosition) else {return nil}
        guard let yPosition = Int(yPosition) else {return nil}
        return MyPoint(xPosition: xPosition, yPosition: yPosition)
    }
}

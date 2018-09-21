//
//  ProtocolFactory.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 9. 4..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ProtocolFactory {
    static func convertProtocol(_ pointSet: [MyPoint]) throws -> MyPointConvertible {
        switch pointSet.count {
        case 2:
            return MyLine(pointA: pointSet[0], pointB: pointSet[1])
        case 3:
            if MyTriangle.verifyFigure(pointSet) == false {
                throw ErrorMessage.Message.unmakeTriangle
            }
            return MyTriangle(pointA: pointSet[0], pointB: pointSet[1], pointC: pointSet[2])
        case 4:
            if MyRect.verifyFigure(pointSet) == false {
                throw ErrorMessage.Message.unmakeRect
            }
            return MyRect(points: pointSet)
        default:
            return pointSet[0]
        }
    }
}

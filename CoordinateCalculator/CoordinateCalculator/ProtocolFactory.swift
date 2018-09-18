//
//  ProtocolFactory.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 9. 4..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ProcotolFactory {
    static func convertProtocol(_ pointSet: [MyPoint]) throws -> MyPointConvertible {
        switch pointSet.count {
        case 1:
            return pointSet[0]
        case 2:
            let line = MyLine(pointA: pointSet[0], pointB: pointSet[1])
            return line as MyPointConvertible
        case 3:
            if MyTriangle.verifyFigure(pointSet) == false {
                throw ErrorMessage.Message.unmakeTriangle
            }
            let triangle = MyTriangle(pointA: pointSet[0], pointB: pointSet[1], pointC: pointSet[2])
            return triangle as MyPointConvertible
        case 4:
            if MyRect.verifyFigure(pointSet) == false {
                throw ErrorMessage.Message.unmakeRect
            }
            let size = CGSize(width: MyLine(pointA: pointSet[0], pointB: pointSet[1]).calculate(), height: MyLine(pointA: pointSet[1], pointB: pointSet[2]).calculate())
            let rect = MyRect(origin: pointSet[0], size: size)
            return rect as MyPointConvertible
        default:
            break
        }
        throw ErrorMessage.Message.excessInputValue
    }
}

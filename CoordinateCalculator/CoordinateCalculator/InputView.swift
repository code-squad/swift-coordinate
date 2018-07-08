//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Huan Suh on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    let limit = ANSICode.axis.AxisLimit
    let outputView = OutputView.init()
    
    public func inputFigure() throws -> Figure? {
        print("좌표를 입력하세요")
        guard let points = parseInput(input: readLine() ?? "") else {
            throw InputError.InvalidFormat
        }
        switch points.count {
        case 1:
            return points[0]
        case 2:
            return MyFigures.MyLine(p1:points[0], p2:points[1])
        case 3:
            do {
                return try MyFigures.MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
            } catch let e {
                throw e
            }
        default:
            throw InputError.InvalidPointCount
        }
    }
    
    private func parseInput(input : String) -> [MyFigures.MyPoint]? {
        var points = [MyFigures.MyPoint]()
        let strPoints = input.split(separator: "-")
        
        for strPt in strPoints {
            let pts = strPt.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
            let strCoords = pts.split(separator: ",")
            
            if(strCoords.count == 2) {
                let x = Int(strCoords[0]) ?? -1
                let y = Int(strCoords[1]) ?? -1
                points.append(MyFigures.MyPoint(x:x, y:y))
            } else {
                return nil
            }
        }
        return points
    }
    
    enum InputError: Error {
        case InvalidFormat
        case InvalidPointCount
        case InvalidTriangle
        case InvalidRect
    }
}

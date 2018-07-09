//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Huan Suh on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    let AxisLimit = ANSICode.axis.AxisLimit
    
    public func inputFigure() throws -> Figure? {
        print("좌표를 입력하세요")
        let points : [MyFigures.MyPoint]
        do {
            try points = parseInput(input: readLine() ?? "")
        } catch let e {
            throw e
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
        case 4:
            do {
                var origin = MyFigures.MyPoint()
                var size = CGSize()
                (origin, size) = try MyFigures.MyRect.getRectConfig(points: points)
                print(points, origin.x, origin.y, size)
                return MyFigures.MyRect(origin: origin, size: size)
            } catch let e {
                throw e
            }
        default:
            throw InputError.InvalidPointCount
        }
    }
    
    private func parseInput(input : String) throws -> [MyFigures.MyPoint] {
        var points = [MyFigures.MyPoint]()
        let strPoints = input.split(separator: "-")
        
        for strPt in strPoints {
            let pts = strPt.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
            let strCoords = pts.split(separator: ",")
            
            if(strCoords.count == 2) {
                let x = Int(strCoords[0]) ?? -1
                let y = Int(strCoords[1]) ?? -1
                if(!checkValid(x: x, y: y)) {
                    throw InputError.InvalidRange(max : AxisLimit)
                }
                points.append(MyFigures.MyPoint(x:x, y:y))
            } else {
                throw InputError.InvalidFormat
            }
        }
        return points
    }
    
    private func checkValid(x : Int, y : Int) -> Bool {
        if(x < 0 || x > AxisLimit) {
            return false
        }
        if(y < 0 || y > AxisLimit) {
            return false
        }
        return true
    }
    
    enum InputError: Error {
        case InvalidRange(max : Int)
        case InvalidFormat
        case InvalidPointCount
        case InvalidTriangle
        case InvalidRect
    }
}

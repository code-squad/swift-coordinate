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
    
    public func inputPoint() throws -> Figure {
        print("좌표를 입력하세요")
        guard let point = parseInput(input: readLine() ?? "") else {
            throw InputError.InvalidFormat
        }
        if(point.count == 1) {
            return point[0]
        }
        throw InputError.InvalidPointCount(required: 1)
    }
    
    private func inputLine() {
        
    }
    
    private func inputTriangle() {
        
    }
    
    private func inputRect() {
        
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
        case InvalidPointCount(required : Int)
    }
}

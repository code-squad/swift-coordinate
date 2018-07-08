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
    
    public func inputPoint() {
        print("좌표를 입력하세요")
        
        guard let point = parseInput(input: readLine()) else {
            printInputError()
            return
        }
        if(point.count == 1) {
            outputView.printFigure(figure: point[0])
        } else {
            printInputError()
        }
    }
    
    private func inputLine() {
        
    }
    
    private func inputTriangle() {
        
    }
    
    private func inputRect() {
        
    }
    
    private func parseInput(input : String?) -> [MyFigures.MyPoint]? {
        if(input == nil) {
            return nil
        }
        
        var points = [MyFigures.MyPoint]()
        let strPoints = input?.split(separator: "-")
        if(strPoints != nil) {
            for strPt in strPoints! {
                let pts = strPt.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
                let strCoords = pts.split(separator: ",")
                if(strCoords.count == 2) {
                    let x = Int(strCoords[0]) ?? -1
                    let y = Int(strCoords[1]) ?? -1
                    points.append(MyFigures.MyPoint(x:x, y:y))
                }
            }
            
            return points
        }
        return nil
    }
    
    private func printInputError() {
        print("잘못된 입력값입니다.")
        inputPoint()
    }
}

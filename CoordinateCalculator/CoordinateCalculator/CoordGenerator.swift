//
//  CoordGenerator.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 02/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordGenerator {
    
    // String에서 좌표값을 뽑아 array로 저장
    static func makeNumericArrayBy(rawInput: String) -> [Int?] {
        let pointElements = rawInput.components(separatedBy:CharacterSet(charactersIn: "-,")).map { $0.trimmingCharacters(in: CharacterSet(charactersIn: "()")) }
        let numericElements = pointElements.map {Int($0)}
        return numericElements
    }
    
    //좌표값array를 입력받아 figure 결정
    static func classifyFigure(coordinates: [Int]) -> MyFigure {
        switch coordinates.count {
        case 4 :
            return MyLine(coordinateArray: coordinates)
        default : return MyPoint(x: coordinates[0], y: coordinates[1])
        }
    }
}

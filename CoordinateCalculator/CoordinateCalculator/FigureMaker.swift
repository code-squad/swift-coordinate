//
//  FigureMaker.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureMaker {
    
    private let separator: Character = ","
    private let meaninglessCharacters: CharacterSet = ["(", ")"]
    
    // text는 이미 검증이 끝난 text를 넘길것
    func getCoordinateFrom(text: String) -> [Int] {
        let coordinate = text.split(separator: self.separator).map{ $0.trimmingCharacters(in: self.meaninglessCharacters) }.compactMap { Int($0) }
        
        return coordinate
    }
    
    func makeMyPointFrom(coordinates: [Int]) -> MyPoint {
        return MyPoint(x: coordinates[0], y: coordinates[1])
    }
}

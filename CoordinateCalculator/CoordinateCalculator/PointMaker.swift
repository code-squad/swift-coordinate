//
//  PointMaker.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PointMaker {
    
    private let hyphen: Character = "-"
    private let meaninglessCharacters: CharacterSet = ["(", ")", ","]
    
    func getMyPoints(_ userInput: String) -> [MyPoint] {
        let splited: [String] = self.splitByHyphen(in: userInput)
        let coordinates: [[Int]] = self.getCoordinateFrom(textCoordinates: splited)
        let myPoints: [MyPoint] = self.makeMyPoint(coordinates)
        
        return myPoints
    }
    
    private func splitByHyphen(in text: String) -> [String] {
        return text.split(separator: hyphen).map(String.init)
    }
    
    private func getCoordinateFrom(textCoordinates: [String]) -> [[Int]] {
        var coordinates = [[Int]]()
        for textCoordinate in textCoordinates {
            coordinates.append(textCoordinate.components(separatedBy: self.meaninglessCharacters).compactMap { Int($0) })
        }
        
        return coordinates
    }
    
    private func makeMyPoint(_ coordinates: [[Int]]) -> [MyPoint] {
        var myPoints = [MyPoint]()
        
        for coordinate in coordinates {
            myPoints.append(MyPoint(x: coordinate[0], y: coordinate[1]))
        }
        
        return myPoints
    }
}

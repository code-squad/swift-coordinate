//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() throws -> MyPoint? {
        print("좌표를 입력하세요.", terminator: "\n")
        
        guard let inputValue = readLine() else {
            throw CoordinatesError.emptyValue
        }
                
        return try splitCoordinates(inputValue)
    }
    
    func splitCoordinates(_ inputValue: String) throws -> MyPoint? {
        guard inputValue.match(for: "\\([0-9]*\\,[0-9]*\\)") else {
            throw CoordinatesError.notFormattedValue
        }
        
        let coordinates = inputValue.trim().splitXY()
        
        for coordinate in coordinates {
            guard coordinate.match(for: "^([0-9]|[1][0-9]|[2][0-4])$") else {
                throw CoordinatesError.outOfRangeCoordinate
            }
        }
        
        return MyPoint(x: Int(coordinates[0]) ?? 0, y: Int(coordinates[1]) ?? 0)
    }
}

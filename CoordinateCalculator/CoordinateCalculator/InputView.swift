//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputViewError: Error {
    case emptyValue
    case outOfRangeCoordinate
}

struct InputView {
    func readInput() throws -> MyPonit? {
        print("좌표를 입력하세요.", terminator: "\n")
        
        guard let inputValue = readLine() else {
            throw InputViewError.emptyValue
        }
                
        return try splitXYCoordinates(splitInputValue(inputValue))
    }
    
    func splitInputValue(_ inputValue: String) throws -> [String] {
        guard inputValue.contains(",") else {
            throw InputViewError.emptyValue
        }
        
        return inputValue.characters.split(separator: ",").map(String.init)
    }
    
    func splitXYCoordinates(_ value: [String]) throws -> MyPonit? {
        guard value.count > 0 else {
            throw InputViewError.emptyValue
        }
        
        let coordinates = value.map({ (s: String) -> (Int) in
            return Int(s.components(separatedBy: ["(", ")"]).joined()) ?? 0
        })
        
        guard coordinates.count > 0 else {
            throw InputViewError.emptyValue
        }
        
        for coordinate in coordinates {
            guard isExceedNumber(coordinate) else {
                throw InputViewError.outOfRangeCoordinate
            }
        }

        return MyPonit(x: coordinates[0], y: coordinates[1])
    }
    
    func isExceedNumber(_ value: Int) -> Bool {
        switch value {
        case 0...24 :
            return true
        default:
            return false
        }
    }
}

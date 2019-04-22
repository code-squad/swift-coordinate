//
//  Validator.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validator {
    
    static func validateInput(of prompt: String) -> (x: Int, y: Int)? {
        
        guard !prompt.isEmpty else {
            return nil
        }
        
        guard let separatedValue = separateCoordinates(of: prompt) else {
            return nil
        }
        
        let numericValue = convertToInt(of: separatedValue)
        
        guard let coordinates = checkCoordinatesLimit(numericValue.x, numericValue.y) else {
            return nil
        }
        
        return coordinates
    }
    
    static private func separateCoordinates(of prompt: String) -> [String]? {
        
        let input = prompt.components(separatedBy: CharacterSet(charactersIn: "()")).joined()
        let coordinates = input.components(separatedBy: ",")
        
        guard coordinates.count > 1 else {
            print("값을 쉼표(,)로 구분해주세요~!~!")
            return nil
        }
        
        return coordinates
    }
    
    static private func convertToInt(of input: [String]) -> (x: Int, y: Int) {
    
        let inputNum = input.map { Int($0) ?? -1 }
        
        
        return (inputNum[0], inputNum[1])
    }
    
    static private func checkCoordinatesLimit(_ x: Int, _ y: Int) -> (x: Int, y: Int)? {
        
        guard x < 25, y < 25 else {
            print("x, y 값은 최대 24까지 입력할 수 있습니다.")
            return nil
        }
        
        guard x > 0 , y > 0 else {
            print("숫자만 입력해주세요.")
            return nil
        }
        
        return (x, y)
    }
}

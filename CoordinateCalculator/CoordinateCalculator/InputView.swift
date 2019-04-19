//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func readInput(of question: String) -> (x: Int, y: Int)? {
        
        ask(question)
        
        guard let prompt = readLine() else {
            return nil
        }
        
        guard let coordinates = separateCoordinates(of: prompt) else {
            return nil
        }

        guard let result = checkCoordinatesLimit(coordinates.x, coordinates.y) else {
            return nil
        }
        
        return result
    }
    
    static private func ask(_ question: String) {
        
        print(question)
    }
    
    static private func separateCoordinates(of prompt: String) -> (x: Int, y: Int)? {
        
        let input = prompt.components(separatedBy: CharacterSet(charactersIn: "()")).joined()
        let coordinates = input.components(separatedBy: ",")
        
        guard coordinates.count > 1 else {
            print("값을 쉼표(,)로 구분해주세요~!~!")
            return nil
        }
        
        guard let x = convertToInt(of: coordinates[0]),
            let y = convertToInt(of: coordinates[1]) else {
                return nil
        }
        
        return (x, y)
    }
    
    static private func convertToInt(of input: String) -> Int? {
        
        guard Int(input) != nil else {
            print("숫자만 입력해주세요.")
            return nil
        }
        
        let coordinate = Int(input)
        
        return coordinate
    }
    
    static private func checkCoordinatesLimit(_ x: Int, _ y: Int) -> (x: Int, y: Int)? {
        
        guard x < 25, y < 25 else {
            print("x, y 값은 최대 24까지 입력할 수 있습니다.")
            return nil
        }
    return (x, y)
    }
}

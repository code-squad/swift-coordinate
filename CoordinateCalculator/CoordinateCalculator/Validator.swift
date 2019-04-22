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
        
        let numericValue = convertToNumeric(of: separatedValue)
        
        guard let coordinates = checkCoordinatesLimit(numericValue.x, numericValue.y) else {
            return nil
        }
        
        return coordinates
    }
    
    /// prompt에 입력된 값을 쉼표로 구분해 반환합니다.
    ///
    /// `(` `)` 를 제거하고, 쉼표 `,` 로 구분한 값을 String 배열로 반환합니다.
    /// 입력값에 쉼표가 없으면, String 배열의 원소 개수가 1개이므로 오류 메세지가 출력되고 nil이 반환됩니다.
    ///
    /// - Parameter prompt: 사용자가 입력한 String 값입니다.
    /// - Returns: 쉼표로 나눠진 String 배열입니다.
    static private func separateCoordinates(of prompt: String) -> [String]? {
        
        let input = prompt.components(separatedBy: CharacterSet(charactersIn: "()")).joined()
        let coordinates = input.components(separatedBy: ",")
        
        guard coordinates.count > 1 else {
            print("값을 쉼표(,)로 구분해주세요~!~!")
            return nil
        }
        
        return coordinates
    }
    
    /// String 배열의 값을 Int형으로 변환해 튜플로 반환합니다.
    ///
    /// Int 형으로 변환할 수 없으면, -1이 기본값으로 들어갑니다.
    /// 배열의 0번째 인덱스에는 x값이, 1번째 인덱스에는 y값이 저장되어있습니다.
    ///
    /// - Parameter input: 쉼표로 나눠진 String 배열입니다.
    /// - Returns: 좌표값을 나타내는 x, y 튜플입니다.
    static private func convertToNumeric(of input: [String]) -> (x: Int, y: Int) {
    
        let inputNum = input.map { Int($0) ?? -1 }
        
        
        return (inputNum[0], inputNum[1])
    }
    
    /// 좌표계가 입력할 수 있는 최소값, 최대값을 확인합니다.
    ///
    /// 최소값은 0, 최대값은 24입니다.
    /// 해당 범위를 초과하게 되면 nil을 반환합니다.
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

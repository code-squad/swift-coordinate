//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // 입력값을 x,y 좌표로 나누기
    private static func extractCoordinate(elements: String?) -> Array<String> {
        guard var element = elements else { return Array<String>() }
        if element.count < 1 {
            return Array<String>()
        }
        // init : (x,y)
        element.removeFirst()
        element.removeLast()
        
        let coordinates = element.components(separatedBy: ",")
        return coordinates
    }
    
    // 단위 변환하기
    private static func convertUnit(from:Array<String>) -> MyPoint {
        guard let stringValueX = from.first else { return MyPoint.init(x: 0, y: 0) }
        guard let stringValueY = from.last else { return MyPoint.init(x: 0, y: 0) }
        
        let valueX:Int? = Int(stringValueX)
        let valueY:Int? = Int(stringValueY)
        if let x = valueX ,let y = valueY {
            return MyPoint.init(x: x, y: y)
        }
        return MyPoint.init(x: 0, y: 0)
    }
    
    // 입력 범위 확인하는 함수
    private static func checkInputRange(elements: MyPoint) -> Bool {
        let valueX = elements.valueX
        let valueY = elements.valueY
        
        var result = false
        if valueX >= 1 && valueX <= 24 && valueY >= 1 && valueY <= 24 {
            result = true
        }
        return result
    }
    
    // 입력할 수 없는 문자 확인
    private static func isAllowCharacters(text:String) -> Bool {
        let allowCharacterSet = CharacterSet.init(charactersIn: "1234567890()-,")
        let notAllowCharacter = text.trimmingCharacters(in: allowCharacterSet)
        return notAllowCharacter.isEmpty ? true : false
    }
    
    // 입력값 받는 함수
    public static func readInput(input:String) -> [MyPoint] {
        var results = [MyPoint]()

        guard isAllowCharacters(text: input) else {
            print("입력할 수 없는 문자가 포함되어 있습니다. 다시 입력해주세요.")
            return results
        }
        
        // '-' 기준으로 나누기
        let elements:Array<String> = input.components(separatedBy: "-")
        for element in elements {
            /*
             1. 입력값 x,y 로 나누기
             2. 단위 변환하기
             3. 입력 범위 확인하기
             */
            let dividedNumbers = extractCoordinate(elements: element)
            let convertedNumbers = convertUnit(from: dividedNumbers)
            let checkValue = checkInputRange(elements: convertedNumbers)
            // 범위를 초과하는 경우 : results값을 비워주고 빈값을 리턴하여 main.swift 에서 다시 처음부터 시작합니다.
            guard checkValue else {
                results.removeAll()
                print("좌표값 범위를 초과하였습니다. 다시 입력해주세요.")
                return results
            }
            results.append(convertedNumbers)
        }
        return results
    }
    
}

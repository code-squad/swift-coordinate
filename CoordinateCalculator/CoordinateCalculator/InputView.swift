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
        // init : (x,y)
        element.removeFirst()
        element.removeLast()
        let coordinate:Array<String> = element.components(separatedBy: ",")
        return coordinate
    }
    
    // 단위 변환하기
    private static func convertUnit(from:Array<String>) -> Array<Int> {
        guard let stringValueX = from.first else { return Array<Int>() }
        guard let stringValueY = from.last else { return Array<Int>() }
        
        var result:Array<Int> = Array<Int>()
        
        let valueX:Int? = Int(stringValueX)
        let valueY:Int? = Int(stringValueY)
        if let x = valueX ,let y = valueY {
            result.append(x)
            result.append(y)
        }
        return result
    }
    
    private static func check(element:Int) -> Bool {
        var result:Bool = false
        if element >= 1 && element <= 24 {
            result = true
        }
        return result
    }
    
    // 입력 범위 확인하는 함수
    private static func checkInputRange(elements: Array<Int>) -> Bool {
        guard let valueX = elements.first else { return false }
        guard let valueY = elements.last else { return false }
        
        let checkX:Bool = check(element: valueX)
        let checkY:Bool = check(element: valueY)
        var result:Bool = false
        if checkX && checkY {
            result = true
        }
        return result
    }
    
    // 입력값 받는 함수
    public static func readInput(input:String) -> Array<Int> {
        /*
         1. 입력값 x,y 로 나누기
         2. 단위 변환하기
         3. 입력 범위 확인하기
         */
        let dividedNumber:Array<String> = extractCoordinate(elements: input)
        let convertedNumber:Array<Int> = convertUnit(from: dividedNumber)
        let checkValue:Bool = checkInputRange(elements: convertedNumber)
        var result:Array<Int> = Array<Int>()
        if checkValue {
            result = convertedNumber
        }
        return result
    }
    
}

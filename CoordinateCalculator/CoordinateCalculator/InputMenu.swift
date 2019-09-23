//
//  InputMenu.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputMenu {
    // get inputLine
    // parse inputLine
    // check isValidInputLine
    // inValidInputLine -> show error message & get inputLine again
    // validInputLine -> return MyPoint
    
    fileprivate static let MAX_COORDINATE_VALUE = 24
    fileprivate static let INVALID_COORDINATE_VALUE = -1
    fileprivate static let ERROR_MESSAGE_INPUTLINE_NILL = "아무것도 입력하지 않았습니다. 다시 입력해주세요"
    fileprivate static let ERROR_MESSAGE_COORDINATE_NILL = "아무것도 입력되지 않은 좌표가 있습니다. 다시 입력해주세요"
    fileprivate static let ERROR_MESSAGE_IS_OVER_VALUE = "24를 초과된 좌표값이 있습니다. 다시 입력해주세요"
    
    static func getCoordinateInfo() -> MyPoint {
        var inputPoint = readInput(afterAsk: parseStringToPoint)
        
        while !isValidPoint(checkPoint: inputPoint) {
            inputPoint = readInput(afterAsk: parseStringToPoint)
        }
        
        return inputPoint!
    }
    
    static func readInput(afterAsk: (String?) -> MyPoint?) -> MyPoint? {
        print("좌표를 입력하세요.")
        let inputLine = readLine()
        return afterAsk(inputLine)
    }
    
    static func parseStringToPoint(inputLine:String?) -> MyPoint? {
        if inputLine == nil || inputLine == ""{
            return nil
        }
        
        let inputArray = inputLine!.components(separatedBy: ["(",",",")"])
        let inputX:Int = Int(inputArray[1]) ?? INVALID_COORDINATE_VALUE
        let inputY:Int = Int(inputArray[2]) ?? INVALID_COORDINATE_VALUE
        
        return MyPoint(x: inputX,y: inputY)
    }
    
    static func isValidPoint(checkPoint:MyPoint?) -> Bool {
        var result = false
        
        if checkPoint == nil {
            print(ERROR_MESSAGE_INPUTLINE_NILL)
            return result
        }
        
        switch (checkPoint!.x, checkPoint!.y) {
        case (INVALID_COORDINATE_VALUE, INVALID_COORDINATE_VALUE) :
            print(ERROR_MESSAGE_COORDINATE_NILL)
        case (INVALID_COORDINATE_VALUE, _):
            print(ERROR_MESSAGE_COORDINATE_NILL)
        case (_,INVALID_COORDINATE_VALUE):
            print(ERROR_MESSAGE_COORDINATE_NILL)
        case let (x,y) where x > 24 || y > 24:
            print(ERROR_MESSAGE_IS_OVER_VALUE)
        case (_, _):
            result = true
        }
        
        return result
    }

}

//
//  InputMenu.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputMenu {
    static func readInput() -> String? {
        print("좌표를 입력하세요.")
        return readLine()
    }
    
//    static func parseStringToIntArray(inputLine:String?) -> [Int]? {
//        var intArray:[Int] = [Int]()
//
//        if(inputLine == nil) {
//            return intArray
//        }
//
//        for (index, stringValue) in inputLine!.components(separatedBy: ["(",",",")"]).enumerated() {
//            if(index != 0) {
//                intArray.append(Int(stringValue) ?? Validation.INVALID_COORDINATE_VALUE)
//            }
//        }
//
//        return intArray
//    }
    
//    static func createPoint(inputLine:String?) -> MyPoint? {
//        if inputLine == nil || inputLine == ""{
//            return nil
//        }
//
//        let inputArray = inputLine!.components(separatedBy: ["(",",",")"])
//        let inputX:Int = Int(inputArray[1]) ?? INVALID_COORDINATE_VALUE
//        let inputY:Int = Int(inputArray[2]) ?? INVALID_COORDINATE_VALUE
//
//        return MyPoint(x: inputX,y: inputY)
//    }
}

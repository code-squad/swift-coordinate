//
//  CoordinateFactory.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 24/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateFactory {
//    static func create<T>(inputLine:String?) -> T {
//        var result:T? = nil
//
//        if T.self is MyPoint {
//            result = createMyPoint(inputLine: inputLine) as? T
//        } else if T.self is MyLine {
//            //result = createMyLine(inputLine:inputLine) as? T
//        }
//
//        return result
//    }
    
    static func createMyPoint(inputLine:String) -> MyPoint {
//        if inputLine == nil || inputLine == "" {
//            return nil
//        }
        
        let inputArray = inputLine.components(separatedBy: ["(",",",")"])
        let inputX:Int = Int(inputArray[1])!
        let inputY:Int = Int(inputArray[2])!
        
        return  MyPoint(x: inputX, y: inputY)
    }
}

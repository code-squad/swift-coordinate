//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
///Users/janggukjin/swift-coordinate/CoordinateCalculator

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    init(x: Int, y:Int){
        self.x = x
        self.y = y
    }
}

struct Distinct {
    private var inputLocation : String? = nil
    
    func distinctLocation(locationText : String?) throws -> MyPoint {
        guard let locationInput : String = locationText else{ throw ErrorMessage.noValueError }
        if locationInput[locationInput.index(before: locationInput.endIndex)] != ")" || locationInput[locationInput.startIndex] != "(" { throw ErrorMessage.nonbracket }
        else {
            var beforeRefineLocation = locationInput
            beforeRefineLocation.removeFirst()
            beforeRefineLocation.removeLast()
            let locations = beforeRefineLocation.split(separator: ",")
            let myPoint = try distinctRangeAndValue(locations: locations)
            return myPoint
        }
    }
    
    func distinctRangeAndValue(locations : [String.SubSequence]) throws -> MyPoint {
        if locations.count != 2 { throw ErrorMessage.outOfRangeError}
        else {
            guard let inputX = Int(locations[0]) else {
                throw ErrorMessage.typeMissError
            }
            guard let inputY = Int(locations[1]) else {
                throw ErrorMessage.typeMissError
            }
            if inputX <= 0 || inputY <= 0 || inputX > 25 || inputY > 25{
                throw ErrorMessage.outOfRangeError
            } else {
                let myPoint = MyPoint.init(x: inputX, y: inputY)
                return myPoint
            }
        }
    }
}

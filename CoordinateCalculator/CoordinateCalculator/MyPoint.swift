//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
///Users/janggukjin/swift-coordinate/CoordinateCalculator

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
}

struct MyPoint {
    private(set) var x = 0
    private(set) var y = 0
    
    init(x: Int, y:Int){
        self.x = x
        self.y = y
    }
}

struct Distinct {
    func splitLocation(twoLocations : String?) throws -> MyLine {
        guard let locationsInput : String = twoLocations, locationsInput != "" else{ throw ErrorMessage.noValueError }
        var beforeRefineLocations = locationsInput
        let dividedLocations = beforeRefineLocations.split(separator: "-")
        if dividedLocations.count != 2 { throw ErrorMessage.outOfRangeError}
        else {
            let pointA = try location(locationText: dividedLocations[0])
            let pointB = try location(locationText: dividedLocations[1])
            let myLine = MyLine.init(pointA: pointA, pointB: pointB)
            return myLine
        }
    }
    
    func location(locationText : String.SubSequence) throws -> MyPoint {
        if locationText == "" { throw ErrorMessage.noValueError }
        else if locationText[locationText.index(before: locationText.endIndex)] != ")" || locationText[locationText.startIndex] != "(" { throw ErrorMessage.nonbracket }
        else {
            var beforeRefineLocation = locationText
            beforeRefineLocation.removeFirst()
            beforeRefineLocation.removeLast()
            let locations = beforeRefineLocation.split(separator: ",")
            let myPoint = try rangeAndValue(locations: locations)
            return myPoint
        }
    }
    
    func rangeAndValue(locations : [String.SubSequence]) throws -> MyPoint {
        if locations.count != 2 { throw ErrorMessage.outOfRangeError}
        else {
            guard let inputX = Int(locations[0]) else {
                throw ErrorMessage.typeMissError
            }
            guard let inputY = Int(locations[1]) else {
                throw ErrorMessage.typeMissError
            }
            let myPoint = try numberRange(inputX: inputX, inputY: inputY)
            return myPoint
        }
    }
    
    func numberRange(inputX : Int, inputY : Int) throws -> MyPoint {
        if inputX <= 0 || inputY <= 0 || inputX > 25 || inputY > 25{
            throw ErrorMessage.outOfRangeError
        } else {
            let myPoint = MyPoint.init(x: inputX, y: inputY)
            return myPoint
        }
    }
}

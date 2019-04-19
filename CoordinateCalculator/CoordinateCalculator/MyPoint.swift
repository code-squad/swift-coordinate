//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation
<<<<<<< HEAD

struct MyPoint {
    var x = 0
    var y = 0
    
    mutating func distinctLocation() throws -> (x: Int, y: Int){
        let locationText = InputView().readInput()
        
        if locationText != nil { throw ErrorMessage.noValueError }
        else {
            let locations = locationText!.split(separator: ",")
            x = try distinctRangeAndValue(locations: locations).inputX
            y = try distinctRangeAndValue(locations: locations).inputY
        }
        return (x,y)
    }
    
    func distinctRangeAndValue(locations : [String.SubSequence]) throws -> (inputX: Int, inputY: Int) {
        if locations.count != 2 { throw ErrorMessage.outOfRangeError}
        else {
            guard let inputX = Int(locations[0]) else {
                throw ErrorMessage.typeMissError
            }
            guard let inputY = Int(locations[1]) else {
                throw ErrorMessage.typeMissError
            }
            return (inputX,inputY)
        }
    }
}
=======
>>>>>>> Modify : 코드를 원래대로 되돌림

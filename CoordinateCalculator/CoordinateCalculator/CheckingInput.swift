//
//  CheckingInput.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckingInput {
    
    func checkInputError (_ inputValue: String?) -> MyPoint {
        var userPointX = 0
        var userPointY = 0
        let userPoint = inputValue ?? "error"
        
        
        if let userPoint = inputValue, userPoint.contains(",") {
            var userPoints = userPoint.split(separator: ",")
            userPointX = Int(userPoints[0])!
            userPointY = Int(userPoints[1])!
        }
        let myPoint = MyPoint(x: userPointX, y: userPointY)
        return myPoint
    }
}

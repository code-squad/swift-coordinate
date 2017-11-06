//
//  FigureData.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 6..
//

import Foundation

struct UserData {
    
    var userPoints: [MyPoint]
    
    init() {
        self.userPoints = []
    }
    
    init(inputData: [MyPoint]) {
        self.userPoints = inputData
    }
    
}

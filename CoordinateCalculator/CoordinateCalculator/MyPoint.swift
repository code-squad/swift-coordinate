//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private var x = 0
    private var y = 0
    
    init(xPos: Int , yPos: Int) {
        self.x = xPos
        self.y = yPos
    }
    
    var X : Int {
        get {
            return self.x
        }
    }
    
    var Y : Int {
        get {
            return self.y
        }
    }
    
    private let xLegend = 2 
    private let yLegend = 25
    private let xPosScale = 2
    
    func xPosToShow() -> Int {
        return xLegend + xPosScale * (self.x)
    }
    
    func yPosToShow() -> Int {
        return yLegend - self.y
    }
    
    static private let MaxPosValue = 24
    
    static func isInValidRange(pos: Int) -> Bool {
        
        if pos <= self.MaxPosValue {
            return true
        }
        else {
            return false
        }
        
        
    }
    
}

//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : ShapeByPoints, Equatable {
    private var x = 0
    private var y = 0
    
    init(x: Int , y: Int) {
        self.x = x
        self.y = y
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
    
    static func isInValidRange(xyPosTuple : XYPosTuple) -> Bool {
        return isInValidRange(pos: xyPosTuple.xPos) && isInValidRange(pos: xyPosTuple.yPos)
    }
    
    func getXYPosArrayToShow() -> [XYPosTuple] {
        return [(xPos: self.xPosToShow(), yPos: self.yPosToShow())]
    }
    
    func getShapeDependentResult() -> String {
        return "입력된 좌표는 (\(self.x), \(self.y))"
    }
    
    public static func ==(lhs: MyPoint, rhs: MyPoint) -> Bool{
        
        return lhs.X == rhs.X && lhs.Y == rhs.Y
        
    }
    
}

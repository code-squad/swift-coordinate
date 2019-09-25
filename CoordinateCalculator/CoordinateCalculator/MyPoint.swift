//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : PointDrawable {
    private var x : Int
    private var y : Int
    
    init(x: Int , y: Int) {
        self.x = x
        self.y = y
    }
    
    init(point: Point) {
        self.init(x: point.xPos, y: point.yPos)
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
    
    var xDrawable : Int {
        get {
            return xLegend + xPosScale * (self.x)
        }
    }
    
    var yDrawable : Int {
        get {
            return yLegend - self.y
        }
    }
}

//static methods
extension MyPoint {
    static private let MaxPosValue = 24
    
    static func isValidInRange(pos: Int) -> Bool {
        
        if pos <= self.MaxPosValue {
            return true
        }
        else {
            return false
        }
    }
    
    static func isValidInRange(point : Point) -> Bool {
        return isValidInRange(pos: point.xPos) && isValidInRange(pos: point.yPos)
    }
}

extension MyPoint : Shapable {
    
    func pointToDraw() -> [PointDrawable] {        
        return [self]
    }
    
//    func shapeDependentResult() -> String {
//        return "입력된 좌표는 (\(self.x), \(self.y))"
//    }
    
    func shapeDependentResult(display: (Shapable, String, Any) -> ()) {
        display(self, "입력된 좌표는 ", "(\(self.x), \(self.y))" )
    }
}

extension MyPoint : Equatable {
    public static func ==(lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.X == rhs.X && lhs.Y == rhs.Y
    }
}

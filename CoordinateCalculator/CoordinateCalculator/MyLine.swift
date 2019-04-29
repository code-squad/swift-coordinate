//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Figure{
   
    private(set) let pointA : MyPoint
    private(set) let pointB : MyPoint
    
    init(_ pointA:MyPoint,_ pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func getDistancebetweenPoints()->Double{
        let xd = pow(Double(pointA.x - pointB.x),2)
        let yd = pow(Double(pointA.y - pointB.y),2)
        return sqrt(xd+yd)
    }
    
    private func printDistancebetweenPoints(){
        print("두 점 사이 거리는 \(self.getDistancebetweenPoints())")
    }
    
    func draw(line:MyLine) {
        draw(point:line.pointA)
        draw(point:line.pointB)
        self.printDistancebetweenPoints()
    }
    
}


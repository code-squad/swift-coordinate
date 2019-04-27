//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Drawable{
   
    private let pointA : MyPoint
    private let pointB : MyPoint
    
    init(_ pointA:MyPoint,_ pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    private func getDistancebetweenPoints(_ pointA:MyPoint,_ pointB:MyPoint)->Double{
        let xd = pow(Double(pointA.x - pointB.x),2)
        let yd = pow(Double(pointA.y - pointB.y),2)
        return sqrt(xd+yd)
    }
    private func printDistancebetweenPoints(){
        print("두 점 사이 거리는 \(self.getDistancebetweenPoints(self.pointA, self.pointB))")
    }
    func draw() {
        self.pointA.draw()
        self.pointB.draw()
        self.printDistancebetweenPoints()
    }
    
}


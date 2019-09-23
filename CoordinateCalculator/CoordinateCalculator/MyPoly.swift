//
//  MyPoly.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 24/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct MyPoly {
    private var myPoints : [MyPoint]!
    
    init (myPoints : [MyPoint]) {
        self.myPoints = myPoints
    }
    
    func area() -> Double {
        var result = 0.0;
        
        for (i, point) in myPoints.enumerated() {
            let j = (i + 1) % myPoints.count
            //area += 0.5 * (x[i]*y[j] -  x[j]*y[i]);
            result += 0.5 * Double(myPoints[i].X * myPoints[j].Y - myPoints[j].X * myPoints[i].Y)
        }
        
        return result
    }
}


extension MyPoly : Shapable {
    func pointToShow() -> [Point] {
        var polyPoints = Array<Point>()
        
        for point in myPoints {
            polyPoints.append(point.pointToShow()[0])
        }
        
        return polyPoints
    }
    
    func shapeDependentResult() -> String {
        let area = self.area()
        
        return "다각형의 넓이는 \(area)"
    }
    
}

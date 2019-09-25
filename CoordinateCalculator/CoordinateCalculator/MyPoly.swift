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
    func pointToDraw() -> [PointDrawable] {
        var polyPoints = Array<PointDrawable>()
        
        for point in self.myPoints {
            let drawablePoint = point.pointToDraw()[0]
            polyPoints.append(drawablePoint)
        }
        
        return polyPoints
    }
    
    func shapeDependentResult(display: (Shapable, String, Any) -> ()) {
        let area = self.area()
        
        display(self, "다각형의 넓이는 ", area)
    }
    
}

//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by hw on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func drawShape (_ myShape: Shapable){
        var result = ""
        let pointList: [MyPoint] = myShape.getDrawablePointList()
        for point in pointList {
            result += "\(ANSICode.text.whiteBright)\(ANSICode.point.drawPoint(point))"
        }
        print (result)
    }
    
    static func displayShapeInformation(_ myShape: Shapable) {
        switch myShape {
        case is Linable :
            let result = displayLineInformation(myShape)
            print (result)
        case is Trianglable :
            let result = displayTriangleInformation(myShape)
            print (result)
        default :
            break
        }
    }
    
    static private func displayLineInformation(_ myShape: Shapable) -> String{
        let myLinable = myShape as! Linable
        let shapeInformation = myLinable.shapeInformation
        let result = "\(ANSICode.text.blueBright)\(ANSICode.line.displayDistance( shapeInformation))\(ANSICode.text.whiteBright)"
        return result
    }
    
    static private func displayTriangleInformation(_ myShape: Shapable) -> String {
        let myTrianglable = myShape as! Trianglable
        let shapeInformation = myTrianglable.shapeInformation
        let result = "\(ANSICode.text.blueBright)\(ANSICode.triangle.displayArea( shapeInformation))\(ANSICode.text.whiteBright)"
        return result
    }
    
}

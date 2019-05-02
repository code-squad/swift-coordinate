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
        case is TwoDimensionable, is Linable:
            let result = displayTwoDimensionalInformation(myShape)
            print (result)
        default :
            break
        }
    }
    
    static private func displayTwoDimensionalInformation(_ myShape: Shapable) -> String{
        let myTwoDimension = myShape as! TwoDimensionable
        let shapeInformation = myTwoDimension.shapeInformation
        let mention = myTwoDimension.description
        let result = "\(ANSICode.text.blueBright)\(ANSICode.shape.displayShapeMention(mention))\(ANSICode.shape.displayShapeInformation(mention.count, shapeInformation))\(ANSICode.text.whiteBright)"
        return result
    }
}

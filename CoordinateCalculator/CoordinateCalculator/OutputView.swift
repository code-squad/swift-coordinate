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
        print(myShape.draw())
        print(myShape.displayShapeInformation())
    }
    
}

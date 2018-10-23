//
//  File.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class PrintView {
    
    static func drawCoordinate() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    static func eraseDisplay() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    

}

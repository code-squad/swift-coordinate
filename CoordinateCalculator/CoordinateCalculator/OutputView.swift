//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static private let descriptionPos = MyPoint(xPos: 0, yPos: 29)
    
    //static private let explodingHead = "\u{1F92F}"
    //static private let coffee = "\u{2615}"
    //static private let babyChick = "\u{1F424}"
    //static private let roundPushPin = "\u{1F4CD}"
    static private let whale = "\u{1F433}"
    //static private let peace = "\u{262E}"
    //static private let normal = "*"
    static private let positonMark = whale
    
    static func showPointOnCoordinatePlane(point : MyPoint) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        
        print("\(ANSICode.cursor.move(row: point.yPosToShow(), col: point.xPosToShow()))", terminator: "")
        
        print("\(ANSICode.text.green)\(positonMark)", terminator: "")
        
        print("\(ANSICode.cursor.move(row: descriptionPos.Y, col: descriptionPos.X))", terminator: "")
        print("\t\(ANSICode.text.white)(x = \(point.X), y = \(point.Y))")
    }
    
    static func printError(message: String) {
        print(message)
    }
}

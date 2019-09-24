//
//  CoordinatePrinter.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func printPoint(point:MyPoint) {
        print(point.description)
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.cursor.move(point: point))⭐️")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}

extension ANSICode.cursor {
    static func move(point:MyPoint) -> String {
        let syncX = point.getX() * 2 + 2
        let syncY = 25 - point.getY()
        return ANSICode.cursor.move(row: syncY, col: syncX)
    }
}

extension OutputView: Errable {
    static func showErrorMessage(errorCase: ErrorCase) {
        print(errorCase.rawValue)
    }
}

protocol Errable {
    static func showErrorMessage(errorCase: ErrorCase)
}

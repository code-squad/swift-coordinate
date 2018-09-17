//
//  protocol.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyPointConvertible {
    func convertMyPoint() -> [MyPoint]
}

protocol FigurePossible {
    static func verifyFigure(_ figue :[MyPoint]) -> Bool
}

protocol FigureCalculation {
    func calculate () -> Double
    var description: String { get }
}

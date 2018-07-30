//
//  Protocols.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 30/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol FigureProtocol {
    var points: [MyPoint] { get }
}

protocol Over1DFigureProtocol: FigureProtocol {
    var valueOfFigure: Double { get }
}

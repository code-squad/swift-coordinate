//
//  Figure.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// Input 좌표 타입은 Mypoint로, output을 위한 좌표 타입 명은 Coordinate로 통일
typealias Coordinate = (row: Int, col: Int)

protocol Figure {
    var points: [MyPoint] { get }
}

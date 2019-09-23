//
//  PointConverter.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol RowAndColConvertable {
    static func convert(_ point: MyPoint) -> RowAndCol
}

struct RowAndCol {
    let row: Int
    let col: Int
}

struct PointConverter: RowAndColConvertable {
    static func convert(_ point: MyPoint) -> RowAndCol {
        let row = 25-point.y
        let col = point.x*2+3
        return RowAndCol(row: row, col: col)
    }
}

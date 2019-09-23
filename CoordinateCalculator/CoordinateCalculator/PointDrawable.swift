//
//  PointDrawable.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol PointDrawable {
    static func draw(point: MyPoint, emoji: String) -> String
}

extension ANSICode {
    struct Point: PointDrawable {
        static func draw(point: MyPoint, emoji: String) -> String {
            return ANSICode.cursor.move(row: (25-point.y), col: point.x*2+3) + emoji
        }
    }
}

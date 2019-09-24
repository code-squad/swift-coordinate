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


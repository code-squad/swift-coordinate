//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x: Int
    var y: Int
}

protocol ValidIdentiable {
    var isValid: Bool { get }
}

extension MyPoint: ValidIdentiable {
    var isValid: Bool {
        return x <= 24 && y <= 24
    }
}
extension MyPoint: Equatable {
    public static func ==(lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

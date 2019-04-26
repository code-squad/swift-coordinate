//
//  Drawable.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Drawable: Shapable {
    func drawShape() -> String
    func displayInformation() -> String
}

extension Drawable {
    func displayInformation() -> String {
        return ""
    }
}

//
//  Shape.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 20/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Drawable: CustomStringConvertible {
    
    var isDrawable: Bool { get }
    
    var points: [Point] { get }
    
}

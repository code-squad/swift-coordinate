//
//  Shape.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 20/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Drawable {
    
    var isDrawable: Bool { get }
    
    func draw()
    
}

//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 10..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyShape {
    var type: Figure { get set }
    
    func calculateOfPosition() -> String
}

//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 14..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyShape {
    var currentShape : String {get set}
    var messageOfShape : String {get set}
    
    func generateCoordinate() -> [MyPoint]
    func calculateShape() -> Double
}

//
//  TwoDimensionable.swift
//  CoordinateCalculator
//
//  Created by hw on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shapable: Pointable{
    var shapeInformation : Double {get}
    var questionMessage: String {get}
}


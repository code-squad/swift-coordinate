//
//  TwoDimensionable.swift
//  CoordinateCalculator
//
//  Created by hw on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol TwoDimensionable: Shapable, CustomStringConvertible{
    var shapeInformation : Double {get}
}


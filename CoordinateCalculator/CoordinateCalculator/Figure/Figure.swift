//
//  Drawable.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 28/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum FigureType : Int{
    case none = 0
    case point = 1
    case line
    case triangle
}

protocol Figure{
    func getPoints()->[MyPoint]
}
extension Figure{
    var type:FigureType{
        return FigureType.init(rawValue:getPoints().count) ?? .none
    }
}


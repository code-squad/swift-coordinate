//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    static func inputToFigure (_ valueEntered: String) throws -> Figure {
        let figure: Figure
        let values = valueEntered.split(separator: "-")
        let type = FigureType(rawValue: values.count)
        
        try InputVerify.verifyInputStandard(values)
        try InputVerify.verifyCoordinateStandard(values)
        
        figure = try FigureFactory.getFigure(type, values)
        
        return figure
    }
}

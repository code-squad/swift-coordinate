//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter: Figure {
    static func inputToFigure (_ valueEntered: String) throws -> Figure {
        var figure: Figure
        let values = valueEntered.split(separator: "-")
        let type = FigureType(rawValue: values.count)
        
        figure = try FigureFactory.getFigure(type, values)
        
        return figure
    }
}

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
        let valueSplit = valueEntered.split(separator: "-")
        var values = [String]()
        
        for value in valueSplit {
            values.append(String(value))
        }
        
        try InputVerify.verifyInputStandard(values)
        let coordinates = try InputVerify.verifyCoordinateStandard(values)
        
        figure = try FigureFactory.getFigure(coordinates)
        
        return figure
    }
}

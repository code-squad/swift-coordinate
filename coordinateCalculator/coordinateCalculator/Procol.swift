//
//  Procol.swift
//  coordinateCalculator
//
//  Created by JINA on 09/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

protocol Figure {
    var point: [MyPoint] {get}
}

protocol calculation: Figure {
    func calculate() -> Double
    func calculateMent() -> String
}

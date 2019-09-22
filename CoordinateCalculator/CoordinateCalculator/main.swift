//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

do {
    let parser = StringPointParser()
    let reader = UserInputReader()
    let verticeProvider = VertexProvider(reader: reader, parser: parser)
    let shape = try ShapeFactory.createShape(verticeProvider: verticeProvider)
    
    let outputView = CoordinateOutputView()
    outputView.print(shape: shape)
}
catch let e {
    print(e.localizedDescription)
}


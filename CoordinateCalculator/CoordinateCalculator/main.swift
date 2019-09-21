//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

do {
    let controller = UserInputController()
    let outputView = CoordinateOutputView()
    
    let point = try controller.readPoint(tries: 3)
    outputView.print(coordinates: [point])
}
catch let e {
    print(e.localizedDescription)
}


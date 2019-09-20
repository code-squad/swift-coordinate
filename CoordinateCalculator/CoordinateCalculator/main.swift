//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation




func main() {
    
    guard let myPoint = InputView.readInput() else {
        return
    }
    
    OutputView.showPointOnCoordinatePlane(point: myPoint)
    
    RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
}

main()








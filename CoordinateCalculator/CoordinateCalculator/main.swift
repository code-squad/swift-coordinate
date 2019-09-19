//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("\(ANSICode.clear)\(ANSICode.home)")
print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")

RunLoop.main.run(until: Date(timeIntervalSinceNow: 15))

//
//  Shame.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    func distinctIndex() -> (locationIndex: Int, myPoints: [MyPoint])
}

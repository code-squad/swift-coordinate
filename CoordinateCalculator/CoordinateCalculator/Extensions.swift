//
//  Extensions.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension String{
    func stringToInt() throws -> Int{
        guard let intValue = Int(self) else {
            throw Exception.ErrorType.wrongFormat
        }
        return intValue
    }
}

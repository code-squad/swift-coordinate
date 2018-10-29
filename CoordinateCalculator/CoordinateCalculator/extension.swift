//
//  File.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {    
    mutating func removeBracket() -> String {
        self.removeFirst()
        self.removeLast()
        return self
    }
}

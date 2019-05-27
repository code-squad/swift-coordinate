//
//  FormatItem.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FormatItem {
    static let coordinateContainer = CharacterSet(charactersIn: "()")
    static let coordinateContainerLeft = "("
    static let coordinateContainerRight = ")"
    static let coordinateItemSeparator = CharacterSet(charactersIn: ",")
    static let pointSeparator = CharacterSet(charactersIn: "-")
}

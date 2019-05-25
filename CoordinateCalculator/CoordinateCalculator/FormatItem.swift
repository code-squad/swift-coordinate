//
//  FormatItem.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FormatItem {
    let coordinateItem = CharacterSet(charactersIn: "0123456789")
    let coordinateContainer = CharacterSet(charactersIn: "()")
    let coordinateItemSeparator = CharacterSet(charactersIn: ",")
    let pointSeparator = CharacterSet(charactersIn: "-")
}

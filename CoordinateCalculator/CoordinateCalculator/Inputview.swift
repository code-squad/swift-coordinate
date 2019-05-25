//
//  Inputview.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation
struct InputView {
    
    static func readInput(_ massage:RequestMassage) -> String {
        
        print(massage.rawValue)
        return readLine() ?? ""
    
    }
    
}

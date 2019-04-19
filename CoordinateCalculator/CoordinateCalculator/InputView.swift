//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func readInput(of question: String) {
        ask(question)
        
    }
    
    static private func ask(_ question: String) {
        print(question)
    }
}

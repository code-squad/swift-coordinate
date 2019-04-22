//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func readInput(of question: String) -> String? {
        
        ask(question)
        
        guard let prompt = readLine() else {
            return nil
        }
        
        return prompt
    }
    
    static private func ask(_ question: String) {
        
        print(question)
    }

}

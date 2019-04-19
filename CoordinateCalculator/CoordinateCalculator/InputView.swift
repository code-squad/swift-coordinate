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
        
        guard let prompt = readLine() else {
            return
        }
        
        separateCoordinate(of: prompt)
       
    }
    
    static private func ask(_ question: String) {
        print(question)
    }
    
    static private func separateCoordinate(of prompt: String) {
        
        let input = prompt.components(separatedBy: CharacterSet(charactersIn: "()")).joined()
        let coordinates = input.components(separatedBy: ",")
        
        let x = coordinates[0]
        let y = coordinates[1]
        
        print("x: \(x) y: \(y)")
        
    }
}

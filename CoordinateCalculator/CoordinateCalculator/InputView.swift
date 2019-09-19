//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput() -> String? {
        print("좌표를 입력하세요.")
        guard let readPoint = readLine() else {
            return nil
        }
        
        return readPoint
    }
}


struct Utility {
    static func parsingStringToPoint(string: String) -> MyPoint? {
        let stringRemovedBrace = String(string.map {
            ($0 == "(" || $0 == ")") ? " " : $0
        })
        //let trimmedString = stringRemovedBrace.trimmingCharacters(in: .whitespaces)
        let trimmedString = stringRemovedBrace.filter { !$0.isNewline && !$0.isWhitespace }
        
        // let parsed = string.replacingOccurrences(of: "(", with: "")
        
        let pointStringArray = trimmedString.split(separator: ",").map{ String($0) }
        
        guard let x = Int(pointStringArray[0]) else {
            return nil
        }
        
        guard let y = Int(pointStringArray[1]) else {
            return nil
        }
        
        return MyPoint(x: x, y: y)
        
       
    }
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput() -> MyPoint? {
        var myPoint : MyPoint!
        while true {
            print("좌표를 입력하세요.")
            guard let readPoint = readLine() else {
                return nil
            }
            
            guard let point = Utility.parsingStringToPoint(string: readPoint) else {
                print("Error: Invalid range (x < 24,y < 24) or format.")
                continue
            }
            
            myPoint = point
            break;
        }
        
        return myPoint
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
        
        if x > 24 || y > 24 {
            return nil
        }
        
        return MyPoint(x: x, y: y)
        
       
    }
}

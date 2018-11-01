//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

struct InputView {
    static func initMyPoint(_ number : (Int,Int)) -> MyPoint {
        let point = MyPoint(x: number.0, y: number.1)
        return point
    }
 
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    // MARK : 좌표 입력 받아서 처리하는 함수
    static func getUserCoordinate() -> MyPoint? {
        let coordinate = readInput(ment: "좌표를 입력하세요.")
        let coordinates = coordinate.removingWhitespaces()
        let check : (Int,Int) = getIntegerForString(coordinates)
        guard check != (0,0) else {
            return nil
        }
        let point = initMyPoint(check)
        return point
    }
    
    static private func getIntegerForString(_ coordinates: String) -> (Int,Int){
        var x = 0 , y = 0 , count = 0
        var number : String = ""

        for char in coordinates {
            if checkBracket(char) == true , count == 0  {
                return (0,0)
            }
            count = count + 1
            
            if char == "," {
                x = changeNumber(number)
                if x == 0 { return (0,0) }
                number = ""
            }else if char == "(" || char == ")" {
                continue
            }
            else {
                number.append(char)
            }
        }
        y = changeNumber(number)
        if y == 0 { return (0,0) }
        return (x,y)
    }
    
    static private func checkBracket(_ char : Character) -> Bool{
        if char == "(" {
            return false
        }
        return true
    }
    
    static private func checkScope(_ num :Int) -> Bool {
        if num <= 0 || num > 24 {
            return false
        }
        return true
    }
    
    static private func changeNumber(_ number : String) -> Int {
        if let num = Int(number) , checkScope(num) == true {
            return num
        }
        return 0
    }
}




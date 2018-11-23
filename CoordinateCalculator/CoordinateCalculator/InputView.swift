//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//
/*
 */

import Foundation

extension String {
    func splitByHyphen() -> [String.SubSequence] {
        return self.split(separator: "-")
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    func changeNumber() -> Int {
        if let num = Int(self) , (num > 0 && num < 25)  {
            return num
        }
        return 0
    }
    func checkBracket() -> Bool {
        let bracket = "("
        let userString = self.startIndex
        if userString == bracket.startIndex {
            return false
        }
        return true
    }
    func cutHyphenCoordinate() -> [String.SubSequence] {
        return self.splitByHyphen()
    }
}

struct InputView {
    
    private static func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    // MARK : 좌표 입력 받아서 문자열로 반환
    static func getUserString() -> String {
        let coordinate = readInput(ment: "좌표를 입력하세요.")
        let coordinates = coordinate.removingWhitespaces()
        return coordinates
    }

    static func getLineCoordinate(_ coordinate: String ,_ count: Int) -> MyLine {
        var noHyphenValue = coordinate.cutHyphenCoordinate()
        var point = [MyPoint(x: 0, y: 0),MyPoint(x: 0, y: 0)]
        let emptyPoint = MyPoint(x: 0, y: 0)

        for i in 0..<count{
            let str = String(noHyphenValue[i])
            let check : (Int,Int) = getIntegerFromString(str)
            guard check.0 != 0 , check.1 != 0 else {
                return MyLine.init(emptyPoint, emptyPoint)
            }
            point[i] = MyPoint.init(x: check.0, y: check.1)
        }
        
        if(point[0].x == point[1].x) && (point[0].y == point[1].y) {
            return MyLine.init(emptyPoint, emptyPoint)
        }
        return MyLine.init(point[0],point[1])
    }
    
    static func getPointCoordinate(_ coordinate: String) -> MyPoint{
        let check : (Int,Int) = getIntegerFromString(coordinate)
        
        guard check.0 != 0 , check.1 != 0 else {
            return MyPoint(x: 0, y: 0)
        }
        return MyPoint.init(x: check.0, y: check.1)
    }
    
    static func checkHyphenCoordinate(_ coordinate : String) -> (Int) {
        let pivot = coordinate.splitByHyphen()
        
        if pivot.count > 4 {
            return 1
        }
        return pivot.count
    }
    
    private static func getIntegerFromString(_ coordinates: String) -> (Int,Int){
        var x = 0 , y = 0 , count = 0
        var number : String = ""
        
        for char in coordinates {
            if coordinates.checkBracket() == true , count == 0  {
                return (0,0)
            }
            count = count + 1
            
            if char == "," {
                x = number.changeNumber()
                if x == 0 { return (0,0) }
                number = ""
            }else if char == "(" || char == ")" {
                continue
            }
            else {
                number.append(char)
            }
        }
        y = number.changeNumber()
        if y == 0{ return (0,0) }
        return (x,y)
    }
    
}




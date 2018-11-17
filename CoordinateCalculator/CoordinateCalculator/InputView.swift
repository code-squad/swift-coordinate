//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//
/*
 * 역전의 원칙 ? : 자동차 - 타이어  :> 타이어를 추상화해서 인터페이스 해라 라는뜻
 */

import Foundation

extension String {
    func splitByHyphen() -> [String.SubSequence] {
        return self.split(separator: "-")
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
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
        //공백제거
        let coordinates = coordinate.removingWhitespaces()
        return coordinates
    }
    
    // - 으로 문자 자르기
    private static func cutHyphenCoordinate(_ coordinate: String ) -> [String.SubSequence] {
        return coordinate.splitByHyphen()
    }
    // count를 확인해서 점인지 , 직선인지 확인
    static func selectResult(_ point: String,_ count: Int) -> [MyPoint?]{
        if count == 2 {
            return getLineCoordinate(point, count)
        }
        return [getPointCoordinate(point)]
    }
    
    //Line 두점 얻기
    static func getLineCoordinate(_ coordinate: String ,_ count: Int) -> [MyPoint?] {
        var noHyphenValue = cutHyphenCoordinate(coordinate)
        var point = [MyPoint(x: 0, y: 0),MyPoint(x: 0, y: 0)]
        for i in 0..<count{
            let str = String(noHyphenValue[i])
            let check : (Int,Int) = getIntegerFromString(str)
            guard check.0 != 0 , check.1 != 0 else {
                return [nil]
            }
            point[i] = MyPoint.init(x: check.0, y: check.1)
        }
        return point
    }
    //point 얻기
    static func getPointCoordinate(_ coordinate: String) -> MyPoint?{
        let check : (Int,Int) = getIntegerFromString(coordinate)
        
        guard check.0 != 0 , check.1 != 0 else {
            return nil
        }
        let point = MyPoint.init(x: check.0, y: check.1)
        return point
    }
    // - 을 기준으로 4개 이상은 (1,2) : point , 2개는 직선, 3점은 삼각형
    static func checkHyphenCoordinate(_ coordinate : String) -> (Int) {
        let pivot = coordinate.splitByHyphen()
        
        if pivot.count > 4 {
            return 1
        }
        return pivot.count
    }
    // 문자열을 숫자로 변경
    private static func getIntegerFromString(_ coordinates: String) -> (Int,Int){
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
    // ( 괄호 체크
    private static func checkBracket(_ char : Character) -> Bool{
        if char == "(" {
            return false
        }
        return true
    }
    // 범위체크
    private static func checkScope(_ num :Int) -> Bool {
        if num <= 0 || num > 24 {
            return false
        }
        return true
    }
    // 문자를 숫자로 변경 : 옵셔널 생기는걸 방지
    private static func changeNumber(_ number : String) -> Int {
        if let num = Int(number) , checkScope(num) == true {
            return num
        }
        return 0
    }
    
}




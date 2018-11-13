//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//
/*
 - 프로토콜 사용
 - 객체 역할 , 책임
 - solid 객체 설계 5원칙
 - 단위테스트
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
    static func initMyPoint(_ number : (Int,Int)) -> MyPoint {
        let point = MyPoint(x: number.0, y: number.1)
        return point
    }
 
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    // MARK : 좌표 입력 받아서 처리하는 함수
    static func getUserCoordinate() -> [MyPoint?] {
        let coordinate = readInput(ment: "좌표를 입력하세요.")
        // 공백제거
        let coordinates = coordinate.removingWhitespaces()
        // - 으로 (,) 몇개인지 확인
        let coordinatesCount = checkHyphenCoordinate(coordinates)
        
        //아래 함수를 분활하게 선택 , if 문을 둬서 2 이면 line , 0이면 point
        if coordinatesCount == 2 {
            return getLineCoordinate(coordinates, coordinatesCount)
        }
        return [getPointCoordinate(coordinates)]
    }
    
    static func getLineCoordinate(_ coordinate: String ,_ count: Int) -> [MyPoint?] {
        var point = [MyPoint(x: 0, y: 0)]
        for i in 0..<count {
            let check : (Int,Int) = getIntegerFromString(coordinate)
            
            guard check != (0,0) else {
                return [nil]
            }
            point[i] = initMyPoint(check)
        }
        return point
    }
    static func getPointCoordinate(_ coordinate: String) -> MyPoint?{
        let check : (Int,Int) = getIntegerFromString(coordinate)
        
        guard check != (0,0) else {
            return nil
        }
        let point = initMyPoint(check)
        return point
    }
    //MARK : - 확인
//    static func checkHyphenCoordinate(_ coordinate : String) -> (String.SubSequence,String.SubSequence) {
//        let pivot = coordinate.splitByHyphen()
//
//        if pivot.count == 2 {
//            return (pivot[0],pivot[1])
//        }
//        return (pivot[0],"0")
//    }
    // MARK:- 갯수로 (,)-(,) 판별
    static private func checkHyphenCoordinate(_ coordinate : String) -> (Int) {
        let pivot = coordinate.splitByHyphen()
        
        if pivot.count < 4 {
            return 1
        }
        return pivot.count
    }

    //MARK: getIntegerFromString 좌표출력하는걸 몇개 불러야할지
    
    static private func getIntegerFromString(_ coordinates: String) -> (Int,Int){
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
    
    // 필요한 요구사항
    /*

     입력을 처리하는 InputView 구조체를 추가하고,
     아래 실행 결과처럼 좌표값 입력하는 메뉴를 구현한다.
     InputView 구조체에서 입력가능한 CharacterSet을 만들어서
     입력된 문자열 중에 입력할 수 없는 문자가 포함되어 있는지 비교한다.
     입력 불가능한 문자가 포함된 경우 다시 입력받는다.
     
 */

}



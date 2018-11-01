//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    // 문자의 공백을 제거하는것 만듬. -0
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

struct InputView {
    // MARK: Mypoint init
    static func initMyPoint(_ number : (Int,Int)) -> MyPoint {
        let point = MyPoint(x: number.0, y: number.1)
        return point
    }
 
    // MARK: 입력만 받는 함수 -1
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    // MARK : 좌표 입력 받아서 처리하는 함수 -2
    static func getUserCoordinate() -> MyPoint? {
        let coordinate = readInput(ment: "좌표를 입력하세요.") // -1
        let coordinates = coordinate.removingWhitespaces() // -0
        let check : (Int,Int) = checkString(coordinates) // -5
        guard check != (0,0) else {
            return nil
        }
        let point = initMyPoint(check)
        return point
    }
    // (3,4) 숫자로 쪼개는 함수 // -5
    static private func checkString(_ coordinates: String) -> (Int,Int){
        //count : 반복문에서 인덱스와 문자 하나하나 접근하는 방법을 몰라서 , 첫번째 검사를 위해 만듬
        var x = 0 , y = 0 , count = 0
        var number : String = ""

        for char in coordinates {
            // 예외처리 : 처음 괄호가 들어오지 않는다면 멈춰라.
            if checkBracket(char) == true , count == 0  { //-3
                return (0,0)
            }
            count = count + 1
            
            if char == "," {
                x = changeNumber(number) //-5
                if x == 0 { return (0,0) }
                number = ""
            }else if char == "(" || char == ")" {
                continue
            }
            else {
                number.append(char)
            }
        }
        y = changeNumber(number) //-5
        if y == 0 { return (0,0) }
        return (x,y)
    }
    
    // MARK: 괄호를 체크하는 함수 -3
    static private func checkBracket(_ char : Character) -> Bool{
        if char == "(" {
            return false
        }
        return true
    }
    // MARK: 1~24까지 범위, 입력초과시 재입력 // -4
    static private func checkScope(_ num :Int) -> Bool {
        if num <= 0 || num > 24 {
            print("24 범위 안에 들어옴 \(num)")
            return false
        }
        return true
    }
    // MARK : 문자를 숫자로 변경하기 위해 (강제 옵셔널이 생겨서 함수로..) -5
    static private func changeNumber(_ number : String) -> Int {
        if let num = Int(number) , checkScope(num) == true {
            print("강제 옵셔널 함수 안 \(num)")
            return num
        }
        return 0
    }
}




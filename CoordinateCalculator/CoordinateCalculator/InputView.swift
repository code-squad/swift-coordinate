//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation
/*
 func splitByComma() -> [String] {
 return self.split(separator: ",").map{String($0)}
 }
 // 로 만들었을때는 readPlayerNames()
 checkPlayerName(commaName) ? commaName.compactMap {LadderPlayer(name: String($0))} : nil
 이부분을 접근할때 문자 하나씩 접근하는데..
 아래와 같이 SubSequence 로 접근하니깐 단어 하나씩 접근한다. 검색을 하고 이것저것 해보다보니 결론은 얻었으나?
 왜? 그런지는 찾지 못하였다.
 */

extension String {
    // 문자의 공백을 제거하는것 만듬.
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

struct InputView {
 
    // MARK: 입력만 받는 함수 -1
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    // MARK : 좌표 입력 받아서 처리하는 함수 -2
    static func getUserCoordinate() -> Int {
        let coordinates = readInput(ment: "좌표를 입력하세요.") // -1
        //괄호 열고 닫는거 관리하려고
        
        let a = checkString(coordinates)
        print(a)
        // 문자열을 하나씩 참조해서 문자냐? 괄호냐? 숫자냐 접근
//        for char in coordinates {
//
//            guard checkBracket(char) != true else {
//                continue
//            }
//
//            if char == "," {
//                x = Int(number)!
//                guard checkScope(x) else {
//                    return 0
//                }
//                number = ""
//            }else {
//                number.append(char)
//            }
//        }
//        y = Int(number)!
//
//        print(x,y)
//
        return 0
    }
    // (3,4) 숫자로 쪼개는 함수
    static private func checkString(_ coordinates: String) -> (Int?,Int?){
        var x = 0 , y = 0 , count = 0 // 맨 처음에 무조건 괄호를 검사하고 싶은데...
        var number : String = ""

        for char in coordinates {
            // 무조건 처음에 ( 여는 괄호 없음 그냥 멈춰.
            if checkBracket(char) == true , count == 0  {
                return (nil,nil)
            }
            count = count + 1
            if char == "," {
                x = Int(number)!
                guard checkScope(x) else {
                    return (nil,nil)
                }
                number = ""
            }else if char == "(" || char == ")" {
                continue
            }
            else {
                number.append(char)
            }
        }
        y = Int(number)!
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
            return false
        }
        return true
    }
    // MARK: 괄호를 없세고 숫자로 반환해준다.
    
    
}




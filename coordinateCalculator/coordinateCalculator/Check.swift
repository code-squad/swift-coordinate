//
//  Check.swift
//  coordinateCalculator
//
//  Created by JINA on 03/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

// 사용자의 입력을 확인하여 MyPoint에 값 넘김
struct Check {
    //사용자의 입력 가능한 문자 확인
    static func checkChar(_ input: String) -> Bool {
        let customCharacterSet = CharacterSet.init(charactersIn: "(),-0123456789")
        let checkedInput = input.trimmingCharacters(in: customCharacterSet)
        guard checkedInput.isEmpty else {
            return false
        }
        return true
    }
    
    //사용자의 입력값에 괄호가 있는지 확인
    static func checkParenthesis(_ input: String) -> Bool {
        guard input.contains("(") && input.contains(")") else {
            return false
        }
        return true
    }
    
    //사용자의 입력값이 허용범위인지 확인
    static func checkNumRange(_ userInput: [Int?]) -> Bool{
        var numRange = true
        for nums in userInput {
            numRange = nums! >= 0 && nums! <= 24 ? true : false
            if numRange == false {
                break
            }
        }
        return numRange
    }
    
    //입력받은 문자열에서 숫자만 가져오기 "(10,10)-(20,20)" -> 옵셔널 [10, 10, 20, 20]
    static func getNum(_ input: String) -> [Int?] {
        let point = input.components(separatedBy: CharacterSet(charactersIn: "-,")).map{$0.trimmingCharacters(in: CharacterSet(charactersIn: "()"))}
        let pointNum = point.map{Int($0)}
        return pointNum
    }
    
    //figure에 값넣기
    static func getFigureValue(_ userInput: [Int?]) -> Figure {
        let num = userInput.map({ (v: Int?) -> (Int) in
            return v ?? 0
        })
        
        switch num.count {
        case 4:
            return MyLine(point: num)
        default:
            return MyPoint(x: num[0], y: num[1])
        }
    static func checkInput(_ input: String) -> Bool {
        if input.contains("("), input.contains(")") {
            return true
        } else {
            return false
        }
    }
    
    static func getNum(_ input: String) -> MyPoint {
        var number = [String]()
        if checkInput(input) == true {
            number = (input.trimmingCharacters(in: CharacterSet.decimalDigits.inverted)).components(separatedBy: ",")
        }
        return MyPoint.init(x: Int(number[0])!, y: Int(number[1])!)
    }
}

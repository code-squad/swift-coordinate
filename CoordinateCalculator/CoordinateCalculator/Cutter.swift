//
//  Cutter.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 커터 구조체
struct Cutter {
    /// 문자열과 정규식을 받아서 정규식에 맞는 문자열 배열로 리턴
    func cuttingLettersFrom(originLatters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLatters as NSString
        return regex.matches(in : originLatters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
    /// 문자열을 받아서 숫자부분만 문자배열로 리턴
    func cutNumberLettersFrom(originLatters : String) -> Array<String>?{
        guard let numberRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forNumberCheck) else {
            return nil
        }
        return cuttingLettersFrom(originLatters: originLatters, regex: numberRegexForm)
    }
    
    /// 문자열을 받아서 좌표부분만 문자배열로 리턴
    func cutAxisFrom(originLatters : String) -> Array<String>?{
        guard let numberRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forAxisCheck) else {
            return nil
        }
        return cuttingLettersFrom(originLatters: originLatters, regex: numberRegexForm)
    }
    
    /// 입력값을 받아서 정규식화 하고 검사한다
    func cutRangeFrom()->Array<Int>?{
        // 유저입력을 위한 변수
        var userInput = ""
        // 정규식 작성을 위한 정규식폼 생성
        guard let inputRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forInputCheck) else {
            return nil
        }
        // 유저입력을 받기 위해서 입력구조체 선언
        let inputView = InputView()
        // 체커 선언
        let checker = Checker()
        // 반복문 체크용 변수
        var loopChecker : Array<Int>? = nil
        repeat {
            // 유저입려을 받는다
            userAxis = inputView.receiveUserInput()
            // 받은 유저 입력을 정규식화
            let userAxis = cuttingLettersFrom(originLatters: userAxis, regex: <#T##NSRegularExpression#>)
            // 정규식화 된 입력값을 숫자만 추출
            guard let numberLetter  = cutNumberLettersFrom(originLatters : regexedUserInput[0]) else {
                continue
            }
            // 숫자문자열배열을 정수형배열로 변환
            guard let numbers = numbersFrom(letters: numberLetter) else {
                continue
            }
            guard checker.checkAxisRange(axisList: numbers) else {
                continue
            }
            loopChecker = numbers
        } while loopChecker == nil
        return loopChecker
    }
}

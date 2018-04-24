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
    private func cuttingLettersFrom(originLatters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLatters as NSString
        return regex.matches(in : originLatters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
    /// 문자열을 받아서 숫자부분만 문자배열로 리턴
    private func cutNumbersFrom(originLatters : String) -> Array<String>?{
        guard let numberRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forNumberCheck) else {
            return nil
        }
        return cuttingLettersFrom(originLatters: originLatters, regex: numberRegexForm)
    }
    
    /// 문자열을 받아서 좌표부분만 문자배열로 리턴
    private func cutAxisFrom(originLatters : String) -> Array<String>?{
        guard let axisRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forAxisCheck) else {
            return nil
        }
        return cuttingLettersFrom(originLatters: originLatters, regex: axisRegexForm)
    }
    
    /// 문자열을 받아서 라인부분만 문자배열로 리턴
    private func cutLineFrom(originLatters : String) -> Array<String>?{
        guard let lineRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forLineCheck) else {
            return nil
        }
        return cuttingLettersFrom(originLatters: originLatters, regex: lineRegexForm)
    }
    
    /// 좌표값 한개를 받아서 정규식화 해서 배열로 리턴
    func cutAxisFrom(userAxis:String)->Array<String>?{
        // 받은 유저 입력을 정규식화
        guard let regexedAxis = cutAxisFrom(originLatters: userAxis) else {
            return nil
        }
        // 정규식을 통과 못하면 nil 리턴
        guard regexedAxis.count > 0 else {
            print("잘못된 좌표입니다.")
            return nil
        }
        //마이포인트 형태로 리턴. 앞에서 두자리인지 체크 완료했음
        return regexedAxis
    }
    
    /// 정규식을 통과한 문자열 1좌표를 마이포인트로 리턴
    func makeMyPointFrom(confirmAxis:String)->MyPoint?{
        // 정규식화 된 입력값을 숫자만 추출
        guard let regexedAxisLatters  = cutNumbersFrom(originLatters : confirmAxis) else {
            return nil
        }
        // 체커 선언
        let checker = Checker()
        // 숫자문자열배열을 정수형배열로 변환
        guard let axisNumbers = checker.numbersFrom(letters: regexedAxisLatters) else {
            return nil
        }
        // 넘어온크숫자들이 기준범위 안인지 체크
        guard checker.checkAxisRange(axisList: axisNumbers) else {
            return nil
        }
        //마이포인트 형태로 리턴. 앞에서 두자리인지 체크 완료했음
        return MyPoint(x: axisNumbers[0], y: axisNumbers[1])
    }
    
    /// 정규식을 통과한 문자열 배열좌표를 마이포인트 배열로 리턴
    func makeMyPointListFrom(confirmedAxisList:Array<String>)->Array<MyPoint>?{
        // 리턴용 마이포인트 배열 선언
        var myPointList = Array<MyPoint>()
        for confirmedAxis in confirmedAxisList {
            guard let myPoint = makeMyPointFrom(confirmAxis: confirmedAxis) else {
                return nil
            }
            myPointList.append(myPoint)
        }
        return myPointList
    }
    
    /// 라인값 한개를 받아서 정규식화 하고 좌표값검사를 부른다
    func isitLineIn(userAxis:String)->Bool{
        // 받은 유저 입력을 정규식화
        guard let regexedAxis = cutLineFrom(originLatters: userAxis) else {
            return false
        }
        // 라인인지 체크
        guard regexedAxis.count > 0 else {
           return false
        }
        return true
    }
}












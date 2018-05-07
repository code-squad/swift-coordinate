//
//  Checker.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Checker {
    /// 숫자를 받아서 좌표값 범위를 체크
    func checkPointRange(pointList : Array<Int>)->Bool{
        // 좌표값의 범위 체크
        for point in pointList {
            guard 0 <= point && 24 >= point else {
                print("범위를 벗어난 좌표값입니다")
                return false
            }
        }
        return true
    }
    
    /// 숫자가 섞인 문자열을 받아서 숫자로 변환 후 좌표 범위 체크
    func checkPointRange(latters:String)->Bool{
        // 입력값을 숫자만 있는 문자형 배열로 정규화
        guard let regexedNumbers = Extracter.extractNumbersFrom(originLatters: latters) else {
            return false
        }
        // 숫자 문자형배열을 숫자형 배열로 리턴
        guard let numbers = Extracter.changeNumbersFrom(letters: regexedNumbers) else {
            return false
        }
        // 나온 숫자들을 범위체크
        return checkPointRange(pointList:numbers)
    }
    
    /// 문자열이 2개좌표 형태가 맞는지 체크
    private func isCorrectLine(latters:String)->Bool {
        // 라인 정규식을 통과시킨다
        guard let line = Extracter.extractLineFrom(originLatters: latters) else {
            return false
        }
        // 통과한 문자열의 카운트를 체크한다
        guard line.count > 0 else {
            // 통과 못하면 2개좌표의 형태가 아니다
            return false
        }
        // 맞으면 참 리턴
        return true
    }
    
    /// 문자열이 1개좌표 형태가 몇개인지 체크
    private func howManyPointIn(latters:String)->Int? {
        // 1개좌표 정규식을 통과시킨다
        guard let point = Extracter.extractPointFrom(originLatters: latters) else {
            return nil
        }
        // 통과한 문자열의 카운트를 체크한다
        let pointCount = point.count
        guard pointCount > 0 else {
            // 통과를 못하면 1개좌표의 형태가 아님
            return nil
        }
        // 검증을 통과했으니 카운트 리턴
        return pointCount
    }
    
    /// 좌표의 형태 전부를 한번에 체크
    func isCorrectPointType(latters:String)->Bool{
        //1개좌표 형태는 무조건 맞아야됨
        guard let pointCount = howManyPointIn(latters: latters) else {
            return false
        }
        // 2개좌표형태가 아닌데 1개좌표가 2개 이상이면 안됨
        if !isCorrectLine(latters: latters) && pointCount > 1 {
            return false
        }
        // 전부 통과했으면 참 리턴
        return true
    }
}

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
    func checkPointRange(letters:String)->Bool{
        // 입력값을 숫자만 있는 문자형 배열로 정규화
        guard let regexedNumbers = Extracter.extractNumbersFrom(originLetters: letters) else {
            return false
        }
        // 숫자 문자형배열을 숫자형 배열로 리턴
        guard let numbers = Extracter.changeNumbersFrom(letters: regexedNumbers) else {
            return false
        }
        // 나온 숫자들을 범위체크
        return checkPointRange(pointList:numbers)
    }
    
    /// 정규화 시도 후 결과 배열의 count 수가 0 이상이면 참. 아니면 거짓.
    func isSame(letters:String, regexedLetters : [String]?)->Bool{
        // 옵셔널인 정규화 결과를 입력
        guard let line = regexedLetters else {
            return false
        }
        // 정규화 전과 후의 문자열을 비교한다
        guard line[0] == letters else {
            // 둘이 다르다면 거짓
            return false
        }
        // 맞으면 참 리턴
        return true
    }
    
    /// 문자열이 1개좌표 형태가 맞는지 체크
    private func isCorrectPoint(letters:String)->Bool {
        return isSame(letters:letters, regexedLetters: Extracter.extractPointFrom(originLetters: letters))
    }
    
    /// 문자열이 2개좌표 형태가 맞는지 체크
    private func isCorrectLine(letters:String)->Bool {
        return isSame(letters:letters, regexedLetters: Extracter.extractLineFrom(originLetters: letters))
    }
    
    /// 문자열이 3개좌표 형태가 맞는지 체크
    private func isCorrectTriangle(letters:String)->Bool {
        // 통과한 문자열의 카운트를 체크한다
        return isSame(letters:letters, regexedLetters: Extracter.extractTriangleFrom(originLetters: letters))
    }
    
    /// 문자열이 4개좌표 형태가 맞는지 체크
    private func isCorrectRectangleType(letters:String)->Bool {
        // 통과한 문자열의 카운트를 체크한다
        return isSame(letters:letters, regexedLetters: Extracter.extractRectangleFrom(originLetters: letters))
    }
    
    /// 배열 안의 값들이 짝수번씩 중복되는지 체크
    func isAllEvenDuplicatedNumbers(_ numbers:[Int])->Bool{
        // 입력값을 받을 배열 선언
        var notDuplicatedList = [Int]()
        // 반복문 실행
        for number in numbers {
            // 배열에 해당 좌표가 있을경우 제거
            if notDuplicatedList.contains(number)  {
                notDuplicatedList = notDuplicatedList.filter{$0 != number}
            }
                // 해당 배열에 없을경우 추가
            else {
                notDuplicatedList.append(number)
            }
        }
        // 직사각형이라면 위의 단계에서 배열에 아무것도 없어야함
        guard notDuplicatedList.isEmpty else {
            // 홀수번 겹친다면 비어있지 않아서 거짓
            return false
        }
        // 체크를 통과하면 참
        return true
    }
    
    /// 마이포인트 배열을 받아서 x,y 값이 각각 2개씩 중복되고 있는지 체크
    func isCorrectRectAxisValue(_ myPoints:[MyPoint])->Bool{
        // x,y 좌표를 받을 배열 선언
        let xPoints = Extracter.extractXPointsFrom(points: myPoints)
        let yPoints = Extracter.extractYPointsFrom(points: myPoints)
        
        // 직사각형이라면 위의 단계에서 배열에 아무것도 없어야함
        guard isAllEvenDuplicatedNumbers(xPoints) && isAllEvenDuplicatedNumbers(yPoints) else {
            // 비어있지 않다면 거짓
            return false
        }
        // 테스트를 통과하면 참
        return true
    }
    
    /// 마이포인트 배열을 받아서 최대 최소값을 구해서 겹쳐진 점이 있는지 체크
    func checkDuplicatedPoints(_ myPoints:[MyPoint])->Bool{
        // 마이포인트 배열을 받아서 가로세로를 받음
        let cgsize = Extracter.extractCGSize(myPoints)
        
        // 둘 중 하나라도 0이 나오면 거짓
        guard cgsize.height != 0 && cgsize.width != 0 else {
            return false
        }
        // 통과하면 참
        return true
    }
    
    /// 4개의 마이포인트 배열을 받아서 각 축 좌표가 2개씩 겹치는지 체크한다
    func isCorrectRectPosition(letters:String)->Bool{
        // 마이포인트로 정규화 한다
        guard let regexedPoints = Extracter.extractPointFrom(originLetters: letters) else {
            return false
        }
        // 포인트 메이커 선언
        let pointerMaker = PointerMaker()
        
        // 정규식화 한 좌표를 받아서 포인터로 생성
        let myPoints = pointerMaker.makeMyPoints(userPoints: regexedPoints)
        
        // 직사각형의 위치값인지 확인
        guard isCorrectRectAxisValue(myPoints) else {
            // 비어있지 않다면 거짓
            return false
        }
        // 위에서 거르지 못한 4개중첩이나 2점중첩을 체크한다
        guard checkDuplicatedPoints(myPoints) else {
            return false
        }
        
        // 테스트를 통과하면 참
        return true
    }
    
    /// 문자열이 4개좌표 정규화 형태와 위차가 맞는지 체크
    private func isCorrectRectangle(letters:String)->Bool {
        // 통과한 문자열의 카운트를 체크한다
        return isCorrectRectangleType(letters: letters) && isCorrectRectPosition(letters:letters)
    }
    
    /// 문자열이 1개좌표 형태가 몇개인지 체크
    private func howManyPointIn(letters:String)->Int? {
        // 1개좌표 정규식을 통과시킨다
        guard let point = Extracter.extractPointFrom(originLetters: letters) else {
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
    func isCorrectPointType(letters:String)->Bool{
        //1개좌표 형태는 무조건 맞아야됨
        guard let pointCount = howManyPointIn(letters: letters) else {
            return false
        }
        switch pointCount {
        // 좌표가 1개인데 포인트 형태인지 체크
        case 1 : guard isCorrectPoint(letters: letters) else {
            return false
            }
        // 좌표가 2개인데 라인 형태인지 체크
        case 2 : guard isCorrectLine(letters: letters) else {
            return false
            }
        // 좌표가 3개인데 삼각형 형태인지 체크
        case 3 : guard isCorrectTriangle(letters: letters) else {
            return false
            }
        // 좌표가 4개인데 사각형 형태인지 체크
        case 4 : guard isCorrectRectangle(letters: letters) else {
            return false
            }
            
        // 해당 사항 없으면 안됨 
        default : return false
        }
        // 전부 통과했으면 참 리턴
        return true
    }
    /// 사각형을 만들기 위해 마이포인트 배열을 받아서 레프트탑 기준점과 가로 세로 를 리턴한다
}
















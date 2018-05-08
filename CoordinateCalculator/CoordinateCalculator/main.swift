//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    // 인풋뷰 구조체 선언
    let inputView = InputView()
    // 체크 기능을 이용하기 위해 체커 선언
    let checker = Checker()
    // 제대로 된 값을 입력할때 까지 입력을 반복
    var repeatFlag = true
    // 유저입력값을 반복문 밖으로 전해줄 변수
    var userPoints = ""
    // 검증을 통과 못하면 입력부터 다시 받는다
    repeat {
        // 사용자 입력을 받는다
        let userInput = inputView.receiveUserInput()
        // 입력한 형태가 좌표형태가 맞는지 체크
        guard checker.isCorrectPointType(letters: userInput) else {
            // 체크 실패시 에러메세지를 출력
            inputView.printErrorMessage()
            continue
        }
        // 좌표값이 범위 내인지 체크
        guard checker.checkPointRange(letters: userInput) else {
            // 체크 실패시 에러메세지를 출력
            inputView.printErrorMessage()
            continue
        }
        // 검증을 통과하면 반복을 중지한다
        repeatFlag = false
        // 검증이 끝난 입력값을 밖으로 내보냄
        userPoints = userInput
    } while repeatFlag
    
    // 통과한 좌표값을 정규식화 한다
    let regexedPoints = Extracter.extractPointFrom(originLetters: userPoints)!
    
    // 포인터 선언
    let pointerMaker = PointerMaker()
    // 정규식화 한 좌표를 받아서 포인터로 생성
    let points = pointerMaker.makePointersFrom(points: regexedPoints)
    
    // 프린트용 구조체 선언
    let outputView = OutputView()
    // 좌표축 프린트
    outputView.drawAxis()
    // 좌표에 특수문자 출력
    outputView.drawPoints(myPoints: points)
}

main()

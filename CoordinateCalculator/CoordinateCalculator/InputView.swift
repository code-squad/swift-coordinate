//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    /// 사용자 입력값을 받는 함수
    func receiveUserInput()->String{
        guard let userInput =  readLine() else {
            return ""
        }
        return userInput
    }
    
    /// 정규식을 통과할때까지 유저입력을 받는 함수
    func receiveUserAxis()->Array<Int>? {
        // 유저입력값을 저장하기 위한 변수
        var userAxis = ""
        // 결과값을 저장하기 위한 배열 선언
        var axisNumbers : Array<Int>?
        
        // 정규식을 이용하기 위해서 커터 선언
        let cutter = Cutter()
        //정규식을 통과할때까지 반복
        repeat {
            // 입력을 위한 안내 메세지 출력
            print("좌표를 입력하세요. 예시: (12,4)")
            // 유저입력값을 저장하는 변수
            userAxis = receiveUserInput()
            axisNumbers = cutter.cutAxisFrom(userAxis: userAxis)
        } while axisNumbers == nil
        return axisNumbers
    }
}
    

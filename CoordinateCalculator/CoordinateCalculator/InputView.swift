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
        // 입력을 위한 안내 메세지 출력
        print("좌표를 입력하세요. 예시: (12,4) 혹은 (1,1)-(11,22)")
        guard let userInput =  readLine() else {
            return ""
        }
        return userInput
    }
    /// 잘못된 입력일 경우 에러메세지 출력
    func printErrorMessage(){
        print ("잘못된 좌표 입니다")
    }
    /// 반복문 이후의 에러의 경우 출력
    func printAfterErrorMessage(){
        print ("반복문 이후에 에러 발생")
    }
    
}
    

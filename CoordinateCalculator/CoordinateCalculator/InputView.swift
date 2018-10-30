//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// MARK : 이름을 , 단위로 구분하기 위해 : 한개의 함수만 사용하는것이 아니기때문에 밖으로 분리
extension String {
    func splitByComma() -> [String.SubSequence] {
        return self.split(separator: ",")
    }
    // 문자의 공백을 제거하는것 만듬.
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

struct InputView {
    func readInput() {

    }
    
    // MARK: 입력만 받는 함수
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    // MARK : 좌표 입력 받는 함수
    static func getUserCoordinate() -> Int {
        let coordinate = readInput(ment: "좌표를 입력하세요.")
        
        // 괄호 체크하는 함수가 들어갈 자리
        return Int(coordinate) ?? 0
    }
    // MARK: 괄호를 체크하는 함수
    func checkBracket(_ coordinate: String) {
        guard coordinate.first == "("  else {
            return
        }
        //여기서 끝내고 함수를 또 만들어서...괄호를 없세고 숫자로 반환해준다.
    }
    
}




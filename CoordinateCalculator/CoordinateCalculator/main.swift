//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

public func main() -> Bool {
    let initValue = InputView.readInput()
    
    // 체크함수 : 입력값 비어 있는지 확인
    guard let inputValue = InputView.checkEmpty(value: initValue) else { return true }
    
    // 체크함수 : 입력할수 없는 문자 확인
    guard InputView.isAllowCharacters(text: inputValue) else { return true }
    
    let coordinates:[MyPoint] = InputView.convertToPoints(value: inputValue)
    
    // 체크함수 : 입력범위 확인
    guard InputView.isExceedRange(elements: coordinates) else { return true }
    
    // 기본 좌표 출력
    guard OutputView.printCoordinates(coordinates: coordinates) else { return true }
    
    // 형태 선택 및 계산과 메세지 리턴
    let selectedShape = InputView.selectShape(coordinates: coordinates)
    let result = OutputView.printMessage(shape: selectedShape)
    return result
}

var play:Bool = true
while play {
    play = main()
}

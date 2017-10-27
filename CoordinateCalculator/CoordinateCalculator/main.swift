//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
var figureStore = FigureStore()

while(true) {
    do {
        guard let points = try inputView.readInput() else { break }
        let figure = try figuerStore.convertArrayToFigure(points)
        OutputView.printFigure(figure)
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfNumber {
        print("좌표 값을 24 이하로 입력해 주세요.")
    } catch InputError.outOfCoordinate {
        print("좌표 개수를 4개 이하로 입력해 주세요.")
    } catch InputError.cannotMakeTriangle {
        print("삼각형을 만들 수 없습니다.")
    } catch InputError.cannotMakeRect {
        print("직 사각형의 좌표만 입력해 주세요.")
    }
    
}

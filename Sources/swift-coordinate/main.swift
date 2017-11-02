//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Points = [(x: Int, y: Int)]

let inputView = InputView()
var points : Points = []
while points.count == 0 {
    do {
        print("좌표를 입력하세요.")
        points = try inputView.readInput()
    } catch CustomErrors.InputError.invalidCharacter {
        print("입력값에 유효하지 않은 문자 혹은 기호가 들어가 있습니다.")
    } catch CustomErrors.InputError.invalidRange {
        print("숫자는 1부터 24까지 가능합니다.")
    } catch CustomErrors.InputError.wrongPoint {
        print("좌표 입력이 올바르지 않습니다.")
    } catch {
        print("입력이 정상적이지 않습니다.")
    }
}

let figureCreator = FigureCreator()
let figure = figureCreator.createFigure(points: points)

let outputView = OutputView(figure: figure)
outputView.drawAll()


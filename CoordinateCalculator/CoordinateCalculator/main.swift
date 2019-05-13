//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    
    while true {
        let inputs = InputView.readInput(Question.request)
        do {
            let points = try inputs.map { try InputValidator.convertStringtoInt(input: $0) }
            let line = MyLine(pointA: points[0], pointB: points[1])
            OutputView.drawAxis(line)
            break
        } catch let err as InputValidator.Error {
            print(err.description)
        } catch {
            print("알 수 없는 에러")
        }
    }
}

main()

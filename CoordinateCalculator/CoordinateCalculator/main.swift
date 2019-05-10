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
        let input = InputView.readInput(Question.request)
        do { let point = try InputValidator.convertStringtoInt(input: input)
            OutputView.drawAxis(pointA: point, pointB: point)
          
            break
        } catch let err as InputValidator.Error {
            print(err.description)
        } catch {
            print("알 수 없는 에러")
        }
    }
}

main()

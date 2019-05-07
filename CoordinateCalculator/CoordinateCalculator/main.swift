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
        let input = InputView.readInput(question: "좌표를 입력하세요. ex.(10,10)")
        do { let point = try InputControl.convertStringtoInt(input: input)
            OutputView.drawAxis(point: point)
            break
        } catch let err as InputControl.Error {
            print(err.description)
            
        } catch {
            print("알 수 없는 에러")
        }
    }
    
    
}

main()

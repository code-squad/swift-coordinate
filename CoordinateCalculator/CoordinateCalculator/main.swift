//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func loopMain() {
    let iv = InputView()
    let ov = OutputView()
    
    OutputView.clear()
    repeat {
        do {
            let figure = try iv.inputPoint()
            ov.printFigure(figure: figure)
            
            if(readLine() == "q") {
                break
            }
            OutputView.clear()
        } catch InputView.InputError.InvalidFormat {
            print("형식에 맞게 입력하세요 : (x,y)-(x,y)...")
        } catch InputView.InputError.InvalidPointCount(let num) {
            print("\(num)개의 좌표를 입력하세요")
        } catch {
            print("Input Error")
        }
    } while(true)
}

loopMain()

//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    var isError = false
    repeat{
        do{
            let inputView = InputView()
            let myPoint = try inputView.readInput()
            let outputView = OutputView.init(myPoint)
            outputView.drawAxis()
            outputView.drawPoint()
            isError = false
        }catch let error as Exception.ErrorType {
            Exception.alertError(type: error)
            isError = true
        }catch {
            Exception.alertError()
            isError = true
        }
    }while isError == true
}

main()



let 사다리게임1 = 사다리게임()
사다리게임1

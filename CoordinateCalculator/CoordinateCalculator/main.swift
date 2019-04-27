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
            let drawable = try inputView.readInput()
            let outputView = OutputView.init(drawable)
            outputView.drawAxis()
            outputView.output()
            isError = false
        }catch let error as Exception.ErrorType {
            print(error)
            isError = true
        }catch {
            print(error)
            isError = true
        }
    }while isError
}

main()

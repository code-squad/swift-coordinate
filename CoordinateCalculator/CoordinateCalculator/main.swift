//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    
    let inputScanner = InputScanner()
    
    var errorFlag = true
    
    while errorFlag {
        do {
            let input = try InputView.readInput()
            let scanedText = try inputScanner.scan(text: input, pattern: InputScanner.validPattern)
            errorFlag = false
        } catch let error as InputViewError {
            print(error.localizedDescription)
            continue
        } catch {
            print("Unexpected error")
            continue
        }
    }
    
    
    // 축 그리기
//    let outputView: OutputView = OutputView()
//    print("\(ANSICode.clear)\(ANSICode.home)")
//    outputView.drawAxis()
}

main()



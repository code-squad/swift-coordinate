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
    let outputView = OutputView()
    
    var errorFlag = true
    
    while errorFlag {
        do {
            let input = try InputView.readInput()
            let scanedText = try inputScanner.scan(text: input, pattern: InputScanner.validPattern)
            let coordinate = inputScanner.getCoordinateFrom(text: scanedText)
            let point = inputScanner.makeMyPointFrom(coordinate: coordinate)
            
            print("\(ANSICode.clear)\(ANSICode.home)")
            outputView.drawPoint(point)
            outputView.drawAxis()
            
            errorFlag = false
            
        } catch let error as InputViewError {
            print(error.localizedDescription)
            continue
        } catch {
            print("Unexpected error")
            continue
        }
    }
}

main()



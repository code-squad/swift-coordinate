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
            let text: String = try InputView.readInput()
            let coordinateText: String = try inputScanner.scan(text: text, pattern: InputScanner.validPattern)
            let coordinate: [Int] = inputScanner.getCoordinateFrom(text: coordinateText)
            let point = inputScanner.makeMyPointFrom(coordinate: coordinate)
            
            print("\(ANSICode.clear)\(ANSICode.home)")
            outputView.drawPoint(point)
            outputView.drawAxis()
            
            errorFlag = false
            
        } catch let error as InputError {
            print(error.localizedDescription)
            continue
        } catch {
            fatalError("Unexpected Error")
        }
    }
}

main()



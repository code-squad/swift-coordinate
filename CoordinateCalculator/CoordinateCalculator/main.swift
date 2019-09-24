//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    let processor = InputProcessor()
    let inputView = InputView(processor: processor)
    
    do {
        let coordinates = try inputView.readInput()
        let coordinated = try processor.makePolygon(coordinates)
        
        let outputView = OutputView()
        coordinated.draw(outView: outputView)
        let areaSize = coordinated.calculateArea()
        coordinated.printResult(outView: outputView, area: areaSize)
        
    } catch let error as ErrorType {
        print(error.description)
    } catch {
        print(ErrorType.unknown.description)
    }
    
}

main()


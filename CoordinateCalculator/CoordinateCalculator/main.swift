//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
repeat{
    let read = InputView.readInput()
    let inputChecked = InputView.checkInput(input: read!);
    if(inputChecked == InputView.InputType.run){
        break
    }else if(inputChecked != InputView.InputType.OK){
        InputView.printErr(errType: inputChecked)
        continue
    }
    let data = InputView.parseInput(input: read!)
    let dataChecked = InputView.checkData(data: data)
    if (InputView.InputType.OK != dataChecked){
        print(InputView.ErrStrDict[dataChecked]!)
        continue
    }
    
    ANSICode.points.add(p: ANSICode.MyPoint(x: Int(data[0])!, y: Int(data[1])!))
    
}while(true)

OutputView.drawAxis();

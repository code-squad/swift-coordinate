//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var read : Bool;
repeat{
    read = ANSICode.InputView.readInput()
}while(read == false)

ANSICode.OutputView.drawAxis();

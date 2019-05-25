//
//  Validatable.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Validatable {
    
    func isContainPointSeparator(_ userInput:String) -> Bool
    
    func isContainPointFormat(_ userInput:String) throws
    
    func isCorrectFormat(_ userInput:String) throws
    
    func hasTwoPoint(_ seperatedInput:[String])throws
    
    func hasTwoItem(_ seperatedUserInput:[String]) throws
    
    func coordinateIsInRange(_ point:(Int,Int)) throws
    
    func isInRange(_ point: Int) throws
    
}

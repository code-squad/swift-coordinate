//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func drawAcoord () {
    var isGameOn: Bool = true
    while (isGameOn == true) {
        do {
            let checkedValue = try Checking().returnCheckedValues(InputView().readInput())
            if checkedValue.x == 0 || checkedValue.y == 0 {
                isGameOn = false
            }
        } catch Checking.ErrorMessage.ofInValidInputedValue{
            print (Checking.ErrorMessage.ofInValidInputedValue.rawValue)
        } catch Checking.ErrorMessage.ofNonexistenceComma {
            print (Checking.ErrorMessage.ofNonexistenceComma.rawValue)
        } catch Checking.ErrorMessage.ofExceedValidInput {
            print (Checking.ErrorMessage.ofExceedValidInput.rawValue)
        } catch {
            print (Checking.ErrorMessage.ofUnKnownError.rawValue)
        }
    }

}

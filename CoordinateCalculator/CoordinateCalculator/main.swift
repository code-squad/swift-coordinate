//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    let distinct = Distinct()
    let input = InputView()
    let output = OutputView()
    var figure : Figure!
    while true {
        let inputText = input.readInput()
        let distinctInput = input.distinctContain(inputLocation: inputText)
        if distinctInput != "" {
            do{
                let inputLocation = try distinct.splitLocation(inputTexts: distinctInput)
                figure = try distinct.callDependingCoordinates(locationCount: inputLocation.locationCount, dividedLocations: inputLocation.dividedLocations)
            }catch let error as ErrorMessage {
                print(error.rawValue)
            }catch {
                print("알수없는 에러입니다.")
            }
            break
        }
    }
    output.drawAxis()
    output.printPoint(figure: figure)
}

main()

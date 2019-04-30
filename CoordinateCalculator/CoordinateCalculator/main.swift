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
        let inputLocation = distinct.splitLocation(inputTexts: distinctInput)
        if distinctInput != "" {
            do {
                figure = try distinct.callDependingCoordinates(locationCount: inputLocation.locationCount, dividedLocations: inputLocation.dividedLocations)
                break
            } catch let error as ErrorMessage {
                print(error.rawValue)
            } catch {
                print("알수없는 에러입니다.")
            }
        }
    }
    output.drawAxis()
    output.printPoint(figure: figure)
    if let guide : Guide = figure as? Guide {
        output.printGuide(guide: guide)
    }
}

main()

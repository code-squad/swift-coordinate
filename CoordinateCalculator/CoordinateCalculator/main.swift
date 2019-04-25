//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    while true {
        do {
            let coordinatesText = try InputView.readInput()
            
            let coordinates = try Converter.convertCoordinates(coordinatesText: coordinatesText)
            
            OutputView.drawAxis()
            OutputView.drawPoint(point: coordinates)
            
            break
        } catch let error as InputError {
            print(error.localizedDescription)
            continue
        } catch let error as CoordinateRangeError {
            print(error.localizedDescription)
            continue
        } catch {
            print("알 수 없는 에러")
            continue
        }
    }
}

main()

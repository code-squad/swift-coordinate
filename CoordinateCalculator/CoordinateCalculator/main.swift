//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    var myLine : MyLine
    var myPoint : MyPoint
    let distinct = Distinct()
    let input = InputView()
    while true {
        let inputText = input.readInput()
        let containDistinct = input.distinctContain(inputLocation: inputText)
        if inputText != nil {
            do{
                myLine = try distinct.splitLocation(twoLocations: inputText)
                OutputView().drawAxis(myLine: myLine)
            }catch ErrorMessage.noValueError {
                print("올바른 값을 입력하세요")
            }catch ErrorMessage.outOfRangeError {
                print("법위를 넘었습니다")
            }catch ErrorMessage.typeMissError {
                print("정수를 입력하세요")
            }catch ErrorMessage.nonbracket {
                print("소괄호를 씌워주세요")
            }catch {
                print("알수없는 에러입니다.")
            }
            break
        }
    }
}

main()


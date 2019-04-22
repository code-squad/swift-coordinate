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
    let output = OutputView()
    while true {
        let inputText = input.readInput()
        let distinctInput = input.distinctContain(inputLocation: inputText)
        if distinctInput != nil {
            do{
                let inputLocation = try distinct.splitLocation(inputTexts: distinctInput)
                switch inputLocation.loctionCount {
                case 2 : // 입력된 Location의 갯수가 2개인 경우
                    myLine = try distinct.twoLocations(dividedLocations: inputLocation.dividedLocations)
                    output.drawAxis()
                    output.printMyLine(myLine: myLine)
                case 1 : // 입력된 Location의 갯수가 1개인 경우
                    myPoint = try distinct.location(locationText: inputLocation.dividedLocations[0])// 원소가 1개이지만 배열을 벗기기 위해 [0]을 사용 (해당 함수는 1개일때 뿐만 아니라 2개일때 각 좌표들에 값을 대입하기 위한 함수로도 쓰이기 때문에)
                    output.drawAxis()
                    output.printMyPoint(myPoint: myPoint)
                default :
                    throw ErrorMessage.outOfRangeError
                }
            }catch ErrorMessage.noValueError {
                print("올바른 값을 입력하세요")
            }catch ErrorMessage.outOfRangeError {
                print("범위를 넘었습니다")
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


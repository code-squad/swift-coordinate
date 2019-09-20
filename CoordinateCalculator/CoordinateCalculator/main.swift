//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation




func main() {
    var myPoint : MyPoint!
    
    while true {
        do {
            let pointString = InputView.readPoint()
            let xyPosTuple = try Utility.parsingStringToXY(pointInBracket: pointString)
            guard  MyPoint.isInValidRange(pos: xyPosTuple.xPos)
                && MyPoint.isInValidRange(pos: xyPosTuple.yPos) else {
                   throw PointValueError.invalidRange
            }
            
            myPoint = MyPoint(xPos: xyPosTuple.xPos, yPos: xyPosTuple.yPos)
            break;
        }
        catch PointValueError.invalidRange {
            OutputView.printError(message: "Invalid range")
            continue
        }
        catch PointValueError.invalidFormat {
            OutputView.printError(message: "Invalid format")
            continue
        }
        catch {
            OutputView.printError(message: "Unexpected error")
            continue
        }
    }
    
    OutputView.showPointOnCoordinatePlane(point: myPoint)
    
    //RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
}

main()








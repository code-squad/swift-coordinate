//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    var shapeByPoints : ShapeByPoints!
    
    while true {
        do {
            let pointString = InputView.readPoint()
            let xyPosTupleArray = try Utility.parsingPointsString(with: pointString)
            
            for xyPosTuple in xyPosTupleArray {
                guard  MyPoint.isInValidRange(xyPosTuple: xyPosTuple) else {
                       throw PointValueError.invalidRange
                }
            }
            
            shapeByPoints = try MakeShape.makeShapeByPoints(xyPosTupleArray: xyPosTupleArray)
            
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
        catch PointValueError.samePoints {
            OutputView.printError(message: "Same points exist.")
            continue
        }
        catch {
            OutputView.printError(message: "Unexpected error")
            continue
        }
    }
    
    OutputView.showPointOnCoordinatePlane(shapeByPoints: shapeByPoints)
    
    //RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
}

main()








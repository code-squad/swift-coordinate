//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    var shapeByPoints : Shapable!
    
    while true {
        do {
            let pointString = InputView.readPoint()
            let points = try Utility.parsingPointsString(with: pointString)            
            shapeByPoints = try MakeShape.makeShapeByPoints(points: points)
            
            break;
        }
        catch PointValueError.invalidRange(let point){
            OutputView.printError(pointError: PointValueError.invalidRange(point: point))
            continue
        }
        catch PointValueError.invalidFormat {
            OutputView.printError(pointError: PointValueError.invalidFormat)
            continue
        }
        catch PointValueError.samePointsExist {
            OutputView.printError(pointError: PointValueError.samePointsExist)
            continue
        }
        catch PointValueError.cantBeRectangle {
            OutputView.printError(pointError: PointValueError.cantBeRectangle)
            continue
        }
        catch PointValueError.cantBeConvexPolygon {
            OutputView.printError(pointError: PointValueError.cantBeConvexPolygon)
            continue
        }
        catch {
            OutputView.printError(pointError: PointValueError.invalidFormat)
            continue
        }
    }
    
    OutputView.showPointOnCoordinatePlane(shapeByPoints: shapeByPoints)
    
    //RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
}

main()








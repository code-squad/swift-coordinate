//
//  Utility.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


enum PointValueError : Error {
    case invalidRange(point: Point)
    case invalidFormat
    case samePointsExist
    case cantBeRectangle
    case cantBeConvexPolygon
    
    func message() -> String {
        switch self {
        case .invalidRange(let point): return "Invalid range \(point)"
        case .invalidFormat: return "Invalid format"
        case .samePointsExist: return "Duplicated point."
        case .cantBeRectangle: return "These points can't be rectange"
        case .cantBeConvexPolygon: return "These points can't be convex polygon"            
        }
    }
    
}


struct Utility {
    static func parsingPointsString(with multiPointString: String) throws -> Array<Point>{
        let pointStrings = splitPointStringArray(pointsString: multiPointString)
        
        //print(pointStringArray)
        
        guard pointStrings.count >= 1 else {
            throw PointValueError.invalidFormat
        }
        
        var points = Array<Point>()
        
        for pointString in pointStrings {
            let point = try parsingStringToXY(pointInBracket: pointString)
            
            points.append(point)
        }
        
        //print(xyTupleArray)
        return points
    }
    
    static func splitPointStringArray(pointsString: String) -> Array<String> {
         return pointsString.split(separator: "-").map{ String($0) }
    }
    
    static func parsingStringToXY(pointInBracket: String) throws -> Point {
        let stringRemovedBracket = String(pointInBracket.map {
            ($0 == "(" || $0 == ")") ? " " : $0
        })
        
        let trimmedString = stringRemovedBracket.filter { !$0.isNewline && !$0.isWhitespace }
        let pointStringArray = trimmedString.split(separator: ",").map{ String($0) }
        
        guard pointStringArray.count == 2 else {
            throw PointValueError.invalidFormat
        }
        
        guard
            let x = Int(pointStringArray[0]),
            let y = Int(pointStringArray[1]) else {
            throw PointValueError.invalidFormat
        }
        
        return (x, y)
    }
    
    static func getClockWisePolygonPoints(orgPoints: [Point]) -> [Point] {
        var p0 : Point = (0,0)
        
        // A utility function to return square of distance between
        // p1 and p2
        func dist(p1:Point, p2:Point) -> Int {
            return (p1.xPos - p2.xPos)*(p1.xPos - p2.xPos) + (p1.yPos - p2.yPos)*(p1.yPos - p2.yPos)
        }
        
        // To find orientation of ordered triplet (p, q, r).
        // The function returns following values
        // 0 --> p, q and r are colinear
        // 1 --> Clockwise
        // 2 --> Counterclockwise
        func orientation(p: Point, q: Point, r: Point) -> Int {
            let value = (q.yPos - p.yPos) * (r.xPos - q.xPos) - (q.xPos - p.xPos) * (r.yPos - q.yPos)
            
            if value == 0 {
                return 0  // colinear
            }
            
            return (value > 0) ? 1 : 2 // clockwise or counterclock wise
        }
        
        // A function used .yPos library function qsort() to sort
        //  an array of points with respect to the first point
        func compare(vp1: Point, vp2: Point) -> Bool {
            let p1 : Point = vp1
            let p2 : Point = vp2
            
            // Find orientation
            let o = orientation(p:p0, q:p1, r:p2)
            
            if (o == 0) {
                return (dist(p1:p0, p2:p2) >= dist(p1:p0, p2:p1))
            }
            
            //return (o == 2)? -1: 1
            return (o == 2)
        }
        
        func run(pointsToSort: [Point]) -> [Point] {
            var points = pointsToSort
            // Find the bottommost point
            var ymin = points[0].yPos
            var min = 0
            for  i in 1...points.count-1 {
                let y = points[i].yPos
                
                // Pick the bottom-most. In case of tie, chose the
                // left most point
                if (y < ymin) || (ymin == y && points[i].xPos < points[min].xPos) {
                    ymin = points[i].yPos
                    min = i
                }
            }
            
            // Place the bottom-most point at first position
            let temp = points[0]
            points[0] = points[min]
            points[min] = temp
            
            //swap(points[0], points[min])
            
            // Sort n-1 points with respect to the first point.
            // A point p1 comes before p2 in sorted ouput if p2
            // has larger polar angle (in counterclockwise
            // direction) than p1
            p0 = points[0]
            let sortedPoints = points.sorted(by: {compare(vp1: $0, vp2: $1)})
            //qsort(&points[1], n-1, sizeof(Point), compare)
            
            return sortedPoints
        }
        
        return run(pointsToSort: orgPoints)
    }
}

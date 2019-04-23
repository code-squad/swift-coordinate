import Foundation

struct Triangle: Drawable, CustomStringConvertible {
    
    var points: [Point] {
        return [lineAB.start, lineAB.end, lineAC.end]
    }
    
    var description: String {
        return "삼각형의 넓이: \(size)"
    }
    
    private let lineAB: Line
    private let lineAC: Line
    private let lineBC: Line
    
    var size: Double {
        let s = (lineAB.distance + lineAC.distance + lineBC.distance) / 2
        return sqrt(s * (s - lineAB.distance) * (s - lineAC.distance) * (s - lineBC.distance))
    }
    
    init(pointA: Point, pointB: Point, pointC: Point) {
        lineAB = Line(start: pointA, end: pointB)
        lineAC = Line(start: pointA, end: pointC)
        lineBC = Line(start: pointB, end: pointC)
    }
    
}

import Foundation

struct Line: Drawable {
    
    var isDrawable: Bool {
        if ANSICode.CoordinateGrid.gridRange.contains(start.x),
            ANSICode.CoordinateGrid.gridRange.contains(start.y),
            ANSICode.CoordinateGrid.gridRange.contains(end.x),
            ANSICode.CoordinateGrid.gridRange.contains(end.y) {
            return true
        }
        return false
    }
    
    
    
    private let start: Point
    private let end: Point
    var distance: Double {
        return sqrt(pow(Double(start.x - end.x), 2) + pow(Double(start.y - end.y), 2))
    }
    
    init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
    
    func draw() {
        CoordinateView.draw(point: start)
        CoordinateView.draw(point: end)
    }
}

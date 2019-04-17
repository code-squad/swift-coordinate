import Foundation

struct Coordinate {
    var x: Int
    var y: Int
    
    
    init?(x: Int, y: Int) {
        guard (x, y) <= (ANSICode.axis.axisLimit, ANSICode.axis.axisLimit) else {
            return nil
        }
        (self.x, self.y) = (x, y)
    }
    
    
}

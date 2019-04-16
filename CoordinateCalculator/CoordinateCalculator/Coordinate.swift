import Foundation

struct Coordinate {
    var x: Int
    var y: Int
    let axisLimit = 24
    
    init(x: Int, y: Int) throws {
        guard (x, y) <= (axisLimit, axisLimit) else {
            throw InputError.exceededAxisLimit
        }
        
        (self.x, self.y) = (x, y)
    }
    
    
}

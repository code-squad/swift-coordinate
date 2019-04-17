import Foundation

func main() throws {
    OutputView.drawAxis()
    let coordinate = try InputView.readCoordinate()
    OutputView.drawPoint(x: coordinate.x, y: coordinate.y)
}

try main()

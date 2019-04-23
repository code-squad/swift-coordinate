import Foundation

func main() {
    
    CoordinateView.drawCoordinatePlane()
    var textView = TextView()
    var coordinateCalculator = CoordinateCalCulator()
    
    while true {
        do {
            let points = try textView.readCoordinates()
            let shape = try coordinateCalculator.addShape(points: points)
            CoordinateView.draw(shape: shape)
            textView.printText(shape.description)
        } catch let error as InputError {
            textView.printText("입력 오류: \(error.description)")
        } catch let error as CoordinateCalculatorError {
            textView.printText("좌표 계산기 오류: \(error.description)")
        } catch {
            textView.printText("예상치 못한 오류: \(error)")
        }
    }
    
    
}

main()


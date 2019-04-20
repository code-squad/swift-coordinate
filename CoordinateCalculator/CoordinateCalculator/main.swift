import Foundation

func main() {
    let coordinateView = CoordinateView()
    var inputView = InputView()
    var points: [Point]
    
    while true {
        do {
            points = try inputView.readCoordinates()
            
            for point in points {
                try coordinateView.draw(point: point)
            }
            
            switch points.count {
            case 2:
                let line = Line(start: points[0], end: points[1])
                inputView.printText(line.description())
            default:
                break
            }
            
        } catch let error as CoordinateViewError {
            inputView.printText("좌표 표시기 오류: \(error.description())")
        } catch let error as InputError {
            inputView.printText("입력 오류: \(error.description())")
        } catch {
            inputView.printText("예상치 못한 오류: \(error)")
        }
    }
    
}

main()

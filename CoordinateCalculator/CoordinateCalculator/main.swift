import Foundation

func main() {
    OutputView.drawAxis()
    var inputView = InputView()
    while true {
        do {
            let coordinate = try inputView.readCoordinate()
            OutputView.drawPoint(coordinate)
        } catch let error as InputError {
            print(error.description())
            inputView.nextLine()
        } catch {
            print("예상치 못한 오류: \(error)")
            inputView.nextLine()
        }
    }
    
}

main()

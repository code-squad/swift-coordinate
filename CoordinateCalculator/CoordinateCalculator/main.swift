import Foundation

func main() {
    
    do {
        OutputView.drawAxis()
        let coordinate = try InputView.readCoordinate()
        OutputView.drawPoint(coordinate)
    } catch let error as InputError {
        print(error.description())
    } catch {
        print("예상치 못한 오류: \(error)")
    }
    
    
    
}

main()

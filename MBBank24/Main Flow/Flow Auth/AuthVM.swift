import Combine
class AuthVM {
    let mainDomain: MainDomain
    @Published var isCorrectCodeAuth = false
    @Published var digitsCodePressed = [Int]()
    init(mainDomain:MainDomain) {
        self.mainDomain = mainDomain
    }
    func pressedDigitCode(digitCode:Int) {
        if digitsCodePressed.count < 5 {
            digitsCodePressed.append(digitCode)
            digitsCodePressed = digitsCodePressed
        }
        if (digitsCodePressed.count == 5) {
            if (mainDomain.getPassword == digitsCodePressed) {
                isCorrectCodeAuth = true
            }
            else {
                digitsCodePressed.removeAll()
            }
        }
    }
    func pressedDeleteDigitCode() {
        digitsCodePressed.popLast( )
        digitsCodePressed = digitsCodePressed
    }
    
}

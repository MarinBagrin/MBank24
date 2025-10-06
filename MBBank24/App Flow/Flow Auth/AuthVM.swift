import Combine
class AuthVM {
    let domain: Domain
    @Published var isCorrectCodeAuth = false
    @Published var digitsCodePressed = ""
    init(domain:Domain) {
        self.domain = domain
    }
    func pressedDigitCode(digitCode:String) {
        if digitsCodePressed.count < 5 {
            digitsCodePressed += digitCode
            digitsCodePressed = digitsCodePressed
        }
        if (digitsCodePressed.count == 5) {
            if (domain.getPassword == digitsCodePressed) {
                isCorrectCodeAuth = true
            }
            else {
                digitsCodePressed.removeAll()
            }
        }
    }
    func pressedDeleteDigitCode() {
        digitsCodePressed.removeLast()
        digitsCodePressed = digitsCodePressed
    }
    
}

import Combine

class AppVM:ObservableObject  {
    var domain:Domain = DomainImpl()
    init(domain:Domain) {
        self.domain = domain
    }
//    var stateApp:CurrentValueSubject<StateApplication, Never> = .init(.unauthed)
    var stateApp = CurrentValueSubject<StateApplication, Never>.init(.unauthed)
    
    func homeFlowTapped() {
            stateApp.value = .home
        
    }
    func depositeFlowTapped() {
            stateApp.value = .deposite
        
    }
    func historyFlowTapped() {
            stateApp.value = .history
        
    }
    func platiFlowTapped() {
            stateApp.value = .plati
        

    }
    func onlineBankFlowTapped() {
            stateApp.value = .onlineBank
    }
}

enum StateApplication {
    case unauthed, home, deposite, history, onlineBank, plati
}

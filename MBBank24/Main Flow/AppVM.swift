import Combine

class AppVM:ObservableObject  {
    var mainDomain = MainDomain()
    init(mainDomain:MainDomain) {
        self.mainDomain = mainDomain
    }
//    var stateApp:CurrentValueSubject<StateApplication, Never> = .init(.unauthed)
    var stateApp = CurrentValueSubject<StateApplication, Never>.init(.unauthed)
    
    func homeFlowTapped() {
        if stateApp.value != .home {
            stateApp.value = .home
        }
    }
    func depositeFlowTapped() {
        if stateApp.value != .deposite {
            stateApp.value = .deposite
        }
    }
    func historyFlowTapped() {
        if stateApp.value != .history {
            stateApp.value = .history
        }
    }
    func platiFlowTapped() {
        if stateApp.value != .plati {
            stateApp.value = .plati
        }

    }
    func onlineBankFlowTapped() {
        if stateApp.value != .onlineBank {
            stateApp.value = .onlineBank
        }
    }
}

enum StateApplication {
    case unauthed, home, deposite, history, onlineBank, plati
}

import Combine

class AppVM:ObservableObject  {
    var mainDomain = MainDomain()
    init(mainDomain:MainDomain) {
        self.mainDomain = mainDomain
    }
//    var stateApp:CurrentValueSubject<StateApplication, Never> = .init(.unauthed)
    @Published var stateApp = StateApplication.unauthed
    
    func homeFlowTapped() {
        if stateApp != .home {
            print(2,stateApp)
            stateApp = .home
            print(2,1,stateApp)
        }
    }
    func depositeFlowTapped() {
        if stateApp != .deposite {
            stateApp = .deposite
            print("deposite")
        }
    }
    func historyFlowTapped() {
        if stateApp != .history {
            stateApp = .history
            print("history")
        }
    }
    func platiFlowTapped() {
        if stateApp != .plati {
            stateApp = .plati
            print("plati")
        }

    }
    func onlineBankFlowTapped() {
        if stateApp != .onlineBank {
            stateApp = .onlineBank
            print("onlineBank")
        }
    }
}

enum StateApplication {
    case unauthed, home, deposite, history, onlineBank, plati
}

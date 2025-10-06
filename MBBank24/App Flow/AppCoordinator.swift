import UIKit
import Combine
class AppCoordinator:Coordinator {
    var parrentCoordinator: Coordinator? = nil
    var childCoordinators = [Coordinator]()
    var viewController = UIViewController()
    var domain = DomainImpl()
    lazy var appVM = AppVM(domain: domain)
    private var cancellables = Set<AnyCancellable>()

    init (window:UIWindow) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        viewController.view.backgroundColor = .white
    }
    func start() {
        subscribeONPublisher()
    }
    
    func setFlowAuth(){
        let tempAuthCoordinator = AuthCoordinator(parrentCoordinator: self,viewController:viewController,domain:domain,appVM:appVM)
        childCoordinators.append(tempAuthCoordinator)
        tempAuthCoordinator.start()
    }
    func setFlowHome(){
        let tempHomeCoordinator = HomeCoordinator(parrentCoordinator: self, viewController: viewController, domain:domain,appVM: appVM)
        childCoordinators.append(tempHomeCoordinator)
        tempHomeCoordinator.start()
    }
    func setFlowOnlinebank(){
        let tempOnlineBankCoordinator = OnlineBankCoordinator(parrentCoordinator: self, viewController: viewController, domain: domain,appVM: appVM)
        childCoordinators.append(tempOnlineBankCoordinator)
        tempOnlineBankCoordinator.start()
    }
    func setFlowDeposite(){
        let tempDepositeCoordinator = DepositeCoordinator(parrentCoordinator: self, viewController: viewController, domain: domain,appVM: appVM)
        childCoordinators.append(tempDepositeCoordinator)
        tempDepositeCoordinator.start( )
    }
    func setFlowPlati(){
        let tempPlatiCoordinator = PlatiCoordinator(parrentCoordinator: self, viewController: viewController, domain: domain, appVM: appVM)
        childCoordinators.append(tempPlatiCoordinator)
        tempPlatiCoordinator.start()
    }
    func setFlowHistory(){
        let tempHistoryCoordinator = HistoryCoordinator(parrentCoordinator: self, viewController: viewController, domain: domain, appVM: appVM)
        childCoordinators.append(tempHistoryCoordinator)
        tempHistoryCoordinator.start()
    }
    private func subscribeONPublisher() {
        appVM.stateApp
            .sink {[weak self]appState in
                guard let self = self else { fatalError("self is nill") }

                childCoordinators.removeAll()
                switch appState {
                case .unauthed:
                    setFlowAuth()
                case .home:
                    setFlowHome()
                case .onlineBank:
                    setFlowOnlinebank()
                case .deposite:
                    setFlowDeposite()
                case .plati:
                    setFlowPlati()
                case .history:
                    setFlowHistory()
                }
            }
            .store(in: &cancellables)
    }
    
}

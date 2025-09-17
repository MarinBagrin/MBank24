import UIKit
import Combine
class AppCoordinator:Coordinator {
    var parrentCoordinator: Coordinator? = nil
    var childCoordinators = [Coordinator]()
    var viewController = UIViewController()
    var mainDomain = MainDomain()
    lazy var appVM = AppVM(mainDomain:mainDomain)
    private var cancellables = Set<AnyCancellable>()

    init (window:UIWindow) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    func start() {
        subscribeONPublisher()
    }
    
    func setFlowAuth(){
        let tempAuthCoordinator = AuthCoordinator(parrentCoordinator: self,viewController:viewController,mainDomain:mainDomain,appVM:appVM)
        childCoordinators.append(tempAuthCoordinator)
        tempAuthCoordinator.start()
    }
    func setFlowDepozite(){}
    
    func setFlowHome(){
        print("3")
        let tempHomeCoordinator = HomeCoordinator(parrentCoordinator: self, viewController: viewController, mainDomain: mainDomain,appVM: appVM)
        childCoordinators.append(tempHomeCoordinator)
        tempHomeCoordinator.start()
        print(3.1)
    }
    func setFlowIstoric(){}
    func setFlowOnlinebank(){}
    func setFlowPlati(){}
    private func subscribeONPublisher() {
        appVM.stateApp
            .sink {[weak self]appState in
                guard let self = self else { fatalError("self is nill") }

                childCoordinators.removeAll()
                if (appState == .unauthed) {
                    setFlowAuth()
                }
                else if (appState == .home) {
                    setFlowHome()
                }
                
                
            }
            .store(in: &cancellables)
    }
    
}

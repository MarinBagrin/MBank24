import UIKit

class AuthCoordinator:Coordinator {
    var childCoordinators = [Coordinator]()
    var parrentCoordinator: Coordinator?
    var viewController:UIViewController
    var mainDomain:MainDomain
    var appVM:AppVM
    init(parrentCoordinator: Coordinator,viewController:UIViewController,mainDomain:MainDomain,appVM:AppVM) {
        self.parrentCoordinator = parrentCoordinator
        self.viewController = viewController
        self.mainDomain = mainDomain
        self.appVM = appVM
        
    }
    deinit {
        //        childCoordinators.removeAll()
        //        viewController = nil
        print("AuthCoordinator deinit")
    }
    func start() {
        let tempVC = AuthVC(coordinator: self,mainDomain:mainDomain)
        tempVC.modalPresentationStyle = .fullScreen
        viewController.present(tempVC, animated: true)
        viewController = tempVC
    }
    func changeHomeFlow() {
        viewController.dismiss(animated: true)
        self.appVM.homeFlowTapped()

    }
    
}

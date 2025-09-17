import UIKit

class HomeCoordinator: Coordinator {
    var parrentCoordinator: Coordinator?
    var viewController: UIViewController
    var childCoordinators = [Coordinator]()
    var mainDomain: MainDomain
    var appVM:AppVM
    init(parrentCoordinator: Coordinator, viewController:UIViewController, mainDomain:MainDomain,appVM:AppVM) {
        self.parrentCoordinator = parrentCoordinator
        self.viewController = viewController
        self.mainDomain = mainDomain
        self.appVM = appVM
    }
    deinit {
        print("Deinit HomeCoordinator")
        viewController.dismiss(animated: true)
    }
    func start() {
        let tempHomeVC = HomeVC(coordinator: self, mainDomain: mainDomain,appVM: appVM)
        tempHomeVC.modalPresentationStyle = .fullScreen
        viewController.present(tempHomeVC, animated: true)
        viewController = tempHomeVC
    }
}
import Combine

class VM: ObservableObject {
    @Published var value = "A"
}

let vm = VM()

// первый подписчик





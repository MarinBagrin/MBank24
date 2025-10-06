import UIKit

class HomeCoordinator: FlowCoordinator {
    
    func start() {
        let tempHomeVC = HomeVC(coordinator: self, domain: domain,appVM: appVM)
        tempHomeVC.modalPresentationStyle = .fullScreen
        viewController.present(tempHomeVC, animated: false)
        viewController = tempHomeVC
    }
    deinit {
        print("Denit \(self)")
    }
}






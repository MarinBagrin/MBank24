import UIKit
import Combine

class DepositeCoordinator:FlowCoordinator {
    func start() {
        let tempDepostieVC = DepositeVC(coordinator:self, domain:domain, appVM:appVM)
        tempDepostieVC.modalPresentationStyle = .fullScreen
        self.viewController.present(tempDepostieVC, animated: false)
        self.viewController = tempDepostieVC
    }
    deinit {
        print("Denit \(self)")
    }
}

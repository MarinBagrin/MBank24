import UIKit
import Combine

class OnlineBankCoordinator:FlowCoordinator {
    func start() {
        let tempOBVC = OnlineBankVC(coordinator:self,domain:domain,appVM:appVM)
        tempOBVC.modalPresentationStyle = .fullScreen
        self.viewController.present(tempOBVC, animated: false)
        self.viewController = tempOBVC
    }
    deinit {
        print("Denit \(self)")
    }
}



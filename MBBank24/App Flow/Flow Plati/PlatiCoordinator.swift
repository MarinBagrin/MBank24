import UIKit
import Combine

class PlatiCoordinator:FlowCoordinator {
    
    func start() {
        let tempPlatiVC = PlatiVC(coordinator:self,domain:domain,appVM:appVM)
        tempPlatiVC.modalPresentationStyle = .fullScreen
        self.viewController.present(tempPlatiVC, animated: false)
        self.viewController = tempPlatiVC
    }
    deinit {
        print("Denit \(self)")
    }
}

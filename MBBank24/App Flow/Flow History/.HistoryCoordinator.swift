import UIKit
import Combine

class HistoryCoordinator:FlowCoordinator {
    
    func start() {
        let tempHistoryVC = HistoryVC(coordinator:self,mainDomain:mainDomain,appVM:appVM)
        tempHistoryVC.modalPresentationStyle = .fullScreen
        self.viewController.present(tempHistoryVC, animated: false)
        self.viewController = tempHistoryVC
    }
    deinit {
        print("Denit \(self)")
    }
}

import UIKit

class AuthCoordinator:FlowCoordinator {
   
   
    func start() {
        let tempAuthVC = AuthVC(coordinator: self,mainDomain:mainDomain,appVM:appVM)
        tempAuthVC.modalPresentationStyle = .fullScreen
        viewController.present(tempAuthVC, animated: false)
        viewController = tempAuthVC
    }
    func changeHomeFlow() {
        viewController.dismiss(animated: true)
        self.appVM.homeFlowTapped()
    }
    deinit {
        print("Denit \(self)")
    }
    
}

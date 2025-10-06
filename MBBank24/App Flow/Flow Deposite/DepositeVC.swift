import UIKit
import Combine

class DepositeVC:FlowVC {
    var depositeVM:DepositeVM
    
    init (coordinator:DepositeCoordinator, domain:Domain, appVM:AppVM) {
        self.depositeVM = DepositeVM(domain: domain)
        super.init(coordinator: coordinator, mainDomain: mainDomain, appVM: appVM, title: "ДЕПОЗИТНЫЙ КАЛЬУЛЯТОР")
        setupUI()
    }
    private func setupUI() {
        view.backgroundColor = [UIColor.red,UIColor.white,UIColor.blue].randomElement()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

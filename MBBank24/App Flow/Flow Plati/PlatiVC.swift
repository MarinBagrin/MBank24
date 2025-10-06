import UIKit
import Combine

class PlatiVC: FlowVC {
    var platiVM: PlatiVM
    init (coordinator:PlatiCoordinator,domain:Domain,appVM:AppVM) {
        self.platiVM = PlatiVM(domain: domain)
        super.init(coordinator: coordinator, domain: domain, appVM: appVM, title: "ПЛАТЕЖИ И ПЕРВЕВОДЫ")
    }
    private func setupUI() {
        view.backgroundColor = [UIColor.red,UIColor.white,UIColor.blue].randomElement()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

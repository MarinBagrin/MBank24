import UIKit
import Combine

class OnlineBankVC: FlowVC {
    private var onlineBankVM: OnlineBankVM

    init(coordinator: OnlineBankCoordinator, domain:Domain, appVM:AppVM) {
        self.onlineBankVM = OnlineBankVM(domain: domain)
        super.init(coordinator: coordinator, domain: domain, appVM: appVM, title: "ONLINEBANK")
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = [UIColor.red,UIColor.white,UIColor.blue].randomElement()
        let backgroundImage: UIImageView = UIImageView()
        self.view.addSubview(backgroundImage)
        backgroundImage.frame.size = self.view.frame.size
        NetworkManager.shared.fetchPhoto { data in
            DispatchQueue.main.async {
                backgroundImage.image = UIImage(data: data)
            }
        }
    }
}

import UIKit
import Combine
class UIFlowBar: UIStackView {
    var flowHome = UIButton()
    var flowOnlineBank = UIButton()
    var flowDeposit = UIButton()
    var flowPlati = UIButton()
    var flowHistory = UIButton()
    var dismissVC: (()->Void)?
    var appVM:AppVM
    private var cancellables = Set<AnyCancellable>()
    init(appVM:AppVM) {
        self.appVM = appVM
        super.init(frame: .zero)
        setupUI()
        addTargets()
        subscribeOnStateApp()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addTargets() {
        self.flowHome.addTarget(self, action: #selector(handleHomeTapped), for: .touchUpInside)
        self.flowOnlineBank.addTarget(self, action: #selector(handleOnlineBankTapped), for: .touchUpInside)
        self.flowDeposit.addTarget(self, action: #selector(handleDepositTapped), for: .touchUpInside)
        self.flowPlati.addTarget(self, action: #selector(handlePlatiTapped), for: .touchUpInside)
        self.flowHistory.addTarget(self, action: #selector(handleHistoryTapped), for: .touchUpInside)
        
    }
    private func subscribeOnStateApp() {

        appVM.stateApp
            .sink {[weak self] stateApp in
                guard let self = self else { fatalError("ErritUIFlowBAR") }
                for flow in [flowHome,flowOnlineBank,flowDeposit,flowPlati,flowHistory] {
                    flow.tintColor = .gray
                }
                switch stateApp {
                case .home:
                    flowHome.tintColor = .systemBlue
                case .onlineBank:
                    flowOnlineBank.tintColor = .systemBlue
                case .deposite:
                    flowDeposit.tintColor = .systemBlue
                case .plati:
                    flowPlati.tintColor = .systemBlue
                case .history:
                    flowHistory.tintColor = .systemBlue
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
    @objc func handleHomeTapped(){
        if (flowHome.tintColor != .systemBlue) {
            self.dismissVC?()
            appVM.homeFlowTapped()
        }
    }
    @objc func handleOnlineBankTapped(){
        if (flowOnlineBank.tintColor != .systemBlue) {
            self.dismissVC?()
            appVM.onlineBankFlowTapped()
        }
    }
    @objc func handleDepositTapped(){
        if (flowDeposit.tintColor != .systemBlue) {
            self.dismissVC?()
            appVM.depositeFlowTapped()
        }
    }
    @objc func handlePlatiTapped(){
        if (flowPlati.tintColor != .systemBlue) {
            
            self.dismissVC?()
            appVM.platiFlowTapped()
        }
    }
    @objc func handleHistoryTapped(){
        if (flowHistory.tintColor != .systemBlue) {
            self.dismissVC?()
            appVM.historyFlowTapped()
        }
    }
    private func setupUI() {
        let lineTop = UIView()
        self.addSubview(lineTop)
        lineTop.translatesAutoresizingMaskIntoConstraints = false
        lineTop.backgroundColor = .lightGray.withAlphaComponent(0.5)
        NSLayoutConstraint.activate([
            lineTop.topAnchor.constraint(equalTo: self.topAnchor),
            lineTop.heightAnchor.constraint(equalToConstant: 1),
            lineTop.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        self.alignment = .top
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)

        flowHome.translatesAutoresizingMaskIntoConstraints = false
        flowOnlineBank.translatesAutoresizingMaskIntoConstraints = false
        flowDeposit.translatesAutoresizingMaskIntoConstraints = false
        flowPlati.translatesAutoresizingMaskIntoConstraints = false
        flowHistory.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .light)
        
        flowHome.setImage(UIImage(systemName: "house.fill",withConfiguration: config), for: .normal)
        flowOnlineBank.setImage(UIImage(systemName: "v.circle",withConfiguration: config), for: .normal)
        flowDeposit.setImage(UIImage(systemName: "percent",withConfiguration: config), for: .normal)
        flowPlati.setImage(UIImage(systemName: "wallet.pass",withConfiguration: config), for: .normal)
        flowHistory.setImage(UIImage(systemName: "clock",withConfiguration: config), for: .normal)
        
        flowHome.tintColor = .gray
        flowOnlineBank.tintColor = .gray
        flowDeposit.tintColor = .gray
        flowPlati.tintColor = .gray
        flowHistory.tintColor = .gray
        
        self.addArrangedSubview(flowHome)
        self.addArrangedSubview(flowOnlineBank)
        self.addArrangedSubview(flowDeposit)
        self.addArrangedSubview(flowPlati)
        self.addArrangedSubview(flowHistory)
        
        
        
    }
}

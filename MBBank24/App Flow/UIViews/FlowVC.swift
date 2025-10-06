import UIKit
import Combine
class FlowVC: UIViewController {
    weak var coordinator: FlowCoordinator?
    private var domain: Domain
    var flowBar: UIFlowBar
    var header: UIHeader
    var cancellables: Set<AnyCancellable> = []
    init (coordinator:FlowCoordinator, domain:Domain, appVM:AppVM,title:String ) {
        self.coordinator = coordinator
        self.domain = domain
        self.flowBar = UIFlowBar(appVM: appVM)
        header = UIHeader(title: title)
        super.init(nibName: nil, bundle: nil)
        self.flowBar.dismissVC = {[weak self] in self?.dismiss(animated: false);}
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //MARK: flowBar
        self.view.addSubview(flowBar)
        self.flowBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flowBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            flowBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -44),
            flowBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            flowBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        //MARK: flowBar
        self.view.addSubview(header)
        self.header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.header.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.header.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 48),
            self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        ])
    }
}

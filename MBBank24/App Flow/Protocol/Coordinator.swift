import UIKit
import Combine
protocol Coordinator:AnyObject {
    var parrentCoordinator: Coordinator? {get set}
    var childCoordinators:[Coordinator] {get set}
    var viewController: UIViewController {get set}
}


class FlowCoordinator:Coordinator {
    weak var parrentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var viewController: UIViewController
    var domain: Domain
    var appVM: AppVM
    var cancellables: Set<AnyCancellable> = []
    
    init(parrentCoordinator:Coordinator,viewController:UIViewController,domain:Domain,appVM:AppVM) {
        self.parrentCoordinator = parrentCoordinator
        self.viewController = viewController
        self.domain = domain
        self.appVM = appVM
    }
}



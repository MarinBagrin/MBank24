import UIKit

protocol Coordinator {
    var parrentCoordinator: Coordinator? {get set}
    var childCoordinators:[Coordinator] {get set}
    var viewController: UIViewController {get set}
}


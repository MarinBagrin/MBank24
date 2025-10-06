import UIKit

protocol UITableCellSelectable {
    var viewSelected: UIView {get set}
    func select()
    func unselect () 
}

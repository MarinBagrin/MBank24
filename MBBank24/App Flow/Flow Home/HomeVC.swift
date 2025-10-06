import UIKit
import Combine

class HomeVC:FlowVC{
    var viewModel:HomeVM
    //var header = UIHeader(title: "ПЛАТЕЖИ И ПЕРЕВОДЫ")
    var mainTable = UITableView(frame: .zero, style: .plain)
    init(coordinator:HomeCoordinator, domain:Domain, appVM:AppVM) {
        self.viewModel = HomeVM(domain: domain)
        super.init(coordinator: coordinator, domain: domain, appVM: appVM, title: "КАРТЫ И СЧЕТА")
        self.setupUI()
    }
    deinit {
        print("Succsefull deinit HomeVC")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        //MARK: header

        self.view.backgroundColor = .white
//        self.view.addSubview(header)
//        self.header.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            self.header.topAnchor.constraint(equalTo: self.view.topAnchor),
//            self.header.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 24),
//            self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//        ])
        
        //MARK: flowBar
        self.view.addSubview(flowBar)
        self.flowBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flowBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            flowBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -44),
            flowBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            flowBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        //MARK: mainTable
        self.view.addSubview(mainTable)
        self.mainTable.translatesAutoresizingMaskIntoConstraints = false
        self.mainTable.backgroundColor = .none
        self.mainTable.dataSource = self
        self.mainTable.delegate = self
        self.mainTable.separatorStyle = .none
        self.mainTable.rowHeight = UITableView.automaticDimension
        self.mainTable.allowsSelection = false
        
        //self.mainTable.estimatedRowHeight = 1000 // пример, желательно задать примерно среднюю высоту

        NSLayoutConstraint.activate([
            self.mainTable.topAnchor.constraint(equalTo: self.header.bottomAnchor),
            self.mainTable.bottomAnchor.constraint(equalTo: self.flowBar.topAnchor),
            self.mainTable.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        ])
    }
    
}

extension HomeVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ["КАРТОЧНЫЕ СЧЕТА", "ТЕКУЩИЕ СЧЕТА", "ДЕПОЗИТЫ", "КРЕДИТЫ", "СЧЕТА В ОБРАБОТКЕ"][section]
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        let row = indexPath.row
        
        switch indexPath.section {
        case 0:
            if (row == 0) {
                let cell0 = tableView.dequeueReusableCell(withIdentifier: "account") ??
                UITableViewCell(style: .value1, reuseIdentifier: "account")
                cell = cell0
                cell.textLabel?.text = "Cont cu card SALUT"
                cell.textLabel?.textColor = UIColor(red: 0, green: 0.1, blue: 0.65, alpha: 1)
                cell.textLabel?.font = .boldSystemFont(ofSize: 18)
                cell.detailTextLabel?.text = FormatterUtills.decoupleNumber(accountInDouble: viewModel.getAccount)
                cell.detailTextLabel?.textColor = UIColor(red: 0.1, green: 0.8, blue: 0.2, alpha: 1)
                cell.detailTextLabel?.font = .boldSystemFont(ofSize: 18)
                cell.backgroundColor = .white
                NSLayoutConstraint.activate([
                    cell.contentView.heightAnchor.constraint(equalToConstant: 55)
                ])
                let sepTop = sepGen
                let sepBottom = sepGen
                sepTop.translatesAutoresizingMaskIntoConstraints = false
                sepBottom.translatesAutoresizingMaskIntoConstraints = false
                cell.contentView.addSubview(sepTop)
                cell.contentView.addSubview(sepBottom)
                NSLayoutConstraint.activate([
                    sepTop.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                    sepTop.widthAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.widthAnchor),
                    sepTop.centerXAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.centerXAnchor),
                    sepBottom.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                    sepBottom.leadingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leadingAnchor),
                    sepBottom.widthAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.widthAnchor),
                ])
                return cell
            }
            else {
                let cell1 = (tableView.dequeueReusableCell(withIdentifier: "cardData") as? UITableViewCardCell) ?? UITableViewCardCell(reuseIdentifier: "cardData")
                cell1.update(credentials: viewModel.getCredentialsCard)
                cell = cell1
                let sepBottom = sepGen
                sepBottom.translatesAutoresizingMaskIntoConstraints = false
                cell.contentView.addSubview(sepBottom)
                NSLayoutConstraint.activate([
                    sepBottom.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                    sepBottom.leadingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leadingAnchor),
                    sepBottom.widthAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.widthAnchor),
                ])
            }
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "default") ?? UITableViewCell(style: .default, reuseIdentifier: "default")
            cell.textLabel?.text = ["Текущие счета", "Депозиты", "Кредиты", "Счета в обработке"][indexPath.section-1]
            cell.contentView.backgroundColor = .lightGray.withAlphaComponent(0.10)
            NSLayoutConstraint.activate([
                cell.contentView.heightAnchor.constraint(equalToConstant: 80)
            ])
        }
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        return cell
    }
   
}
var sepGen: UIView {
    let sep = UIView()
    sep.translatesAutoresizingMaskIntoConstraints = false
    sep.backgroundColor = .separator.withAlphaComponent(0.2)
    NSLayoutConstraint.activate([
        sep.heightAnchor.constraint(equalToConstant: 1)
    ])
    return sep
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .gray
        header.textLabel?.font = .systemFont(ofSize: 14)
//           var config = header.defaultContentConfiguration()
//           config.text = header.textLabel?.text
//           config.textProperties.color = .black          // цвет текста
//           config.textProperties.font = .boldSystemFont(ofSize: 16)
//
//           header.contentConfiguration = config
//           header.contentView.backgroundColor = .lightGray
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // indexPath.section — секция
        // indexPath.row — строка
        print("Нажата строка \(indexPath.row) в секции \(indexPath.section)")
        
        // Тут можно делать навигацию, менять данные, вызывать alert и т.д.
        
        // Если хочешь, чтобы ячейка сразу перестала быть выделенной:
        
        tableView.deselectRow(at: indexPath, animated: false)
    }

}

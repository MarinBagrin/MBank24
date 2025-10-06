import UIKit
import Combine

class HistoryVC: FlowVC {
    //MARK: Logic
    var historyVM: HistoryVM
    //MARK: UI
    var historyTable = UITableView()
    
    init (coordinator:HistoryCoordinator,domain:Domain,appVM:AppVM) {
        self.historyVM = HistoryVM(domain: domain)
        super.init(coordinator: coordinator, mainDomain: mainDomain, appVM: appVM, title: "ИСТОРИЯ ТРАНЗАКЦИИ")
        setupUI()
    }
    private func setupUI() {
        //MARK: selfView
        self.view.backgroundColor = .white
        //MARK: HistoryTabel
        self.view.addSubview(self.historyTable)
        self.historyTable.translatesAutoresizingMaskIntoConstraints = false
        
        self.historyTable.backgroundColor = .white
        self.historyTable.separatorStyle = .none
        self.historyTable.rowHeight = UITableView.automaticDimension
        self.historyTable.dataSource = self
        self.historyTable.delegate = self
        NSLayoutConstraint.activate([
            self.historyTable.topAnchor.constraint(equalTo: self.header.bottomAnchor),
            self.historyTable.bottomAnchor.constraint(equalTo: self.flowBar.topAnchor),
            self.historyTable.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryVC:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let countDates = self.historyVM.countDatesTransactions
        if countDates <= 29 {
            return countDates + 1
        }
        else {
            return 31
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        else {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            
            guard let date = formatter.date(from: historyVM.getDatesHistoryTransactions[section-1]) else {fatalError("нельзя отформатировать стригу в дату")}
            let day = Calendar.current.component(.day, from: date)
            let month = Calendar.current.component(.month, from: date)
            let monthsOnRussian: [Int: String] = [
                1: "ЯНВАРЯ",
                2: "ФЕВРАЛЯ",
                3: "МАРТА",
                4: "АПРЕЛЯ",
                5: "МАЯ",
                6: "ИЮНЯ",
                7: "ИЮЛЯ",
                8: "АВГУСТА",
                9: "СЕНТЯБРЯ",
                10: "ОКТЯБРЯ",
                11: "НОЯБРЯ",
                12: "ДЕКАБРЯ"
            ]
            return "\(day) \(monthsOnRussian[month] ?? "неизвестный месяц")"/*arrayDates[section-1].formatted(date: .complete, time: .omitted)*/
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let historyTransactions = self.historyVM.getHistoryTransactions
        let datesTransactions = self.historyVM.getDatesHistoryTransactions
        if section == 0 {
            return 1
        }
        else {
            guard let countTransactions = historyTransactions[datesTransactions[section-1]]?.count else {fatalError("по указанной дате нету списка таназакции")}
            return countTransactions
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "analytic") ?? UIAnalyticTransactionsCell(reuseIdentifier: "analytic")
        }
        else {
            let dict = historyVM.getHistoryTransactions
            let array = historyVM.getDatesHistoryTransactions
            let transaction = dict[array[indexPath.section-1]]![indexPath.row]
            let transactionCell = (tableView.dequeueReusableCell(withIdentifier: "transaction") as? UITransactionCell) ?? UITransactionCell(reuseIdentifier: "transaction")
            transactionCell.updateView(transaction: transaction)
            cell = transactionCell
        }
        
        return cell
    }
}

extension HistoryVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else {fatalError("Не поулилось сделать headerView")}
        headerView.textLabel?.textColor = .systemGray
        headerView.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let selectableCell = tableView.cellForRow(at: indexPath) as? UITableCellSelectable else {fatalError("FEW Sellectable")}
//        selectableCell.select()
//    }
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        guard let selectableCell = tableView.cellForRow(at: indexPath) as? UITableCellSelectable else {print("FEW Sellectable");return}
//        selectableCell.unselect()
//
//    }
}

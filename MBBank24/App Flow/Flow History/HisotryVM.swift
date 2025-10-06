import UIKit
import Combine

class HistoryVM {
    private var domain:Domain
    private var cancellables: Set<AnyCancellable> = []
    init(domain:Domain) {
        self.domain = domain
        subscribeONPublish()
    }
    func subscribeONPublish() {
        domain.getAnyPublisherCountDatesHistoryTransactions
            .sink { [weak self] arrayDates in
                self?.countDatesTransactions = arrayDates.count
            }
            .store(in: &cancellables)
    }
    var countDatesTransactions = 0

    var getHistoryTransactions: [String:[TransactionDomain]] {
        return domain.getHistoryTransactions
    }
    var getDatesHistoryTransactions: [String] {
        return domain.getDatesHistoryTransactions
    }
}

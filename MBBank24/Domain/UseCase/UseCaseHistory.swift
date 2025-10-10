//
//  UseCaseHistory.swift
//  MBBank24
//
//  Created by Marin Bagrin on 09.10.2025.
//

protocol UseCaseHistory {
    
    var historyTransactions: [String:[TransactionDomain]] {get}
    
    var datesHistoryTransactions: [String] {get}
    
    var countHistoryTransactionsForDates: [String] {get}
}

class UseCaseHistoryImpl: UseCaseHistory {
    private let repository: RepositoryHistory
    init(repository: RepositoryHistory) {
        self.repository = repository
    }
    var historyTransactions: [String: [TransactionDomain]] = [:]
    var datesHistoryTransactions: [String] = []
    var countHistoryTransactionsForDates: [String] = []
}

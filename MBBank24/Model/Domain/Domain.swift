import Combine
import Foundation
protocol Domain {

    var password: String? {get}
    
    var credentialsCard: CredentialsCardDomain? {get}
    
    var account:Double {get}
  
    var historyTransactions: [String:[TransactionDomain]] {get}
    
    var datesHistoryTransactions: [String] {get}
    
    var anyPublisherCountDatesHistoryTransactions: AnyPublisher<[String], Never> {get}
    
}
class DomainImpl:Domain{
    //добавить кей чайн

    private var storageManager:StorgaeManager = StorageManagerImpl()
    
    private var storedHistoryTransactions: [String:[TransactionDomain]] = [:]
    
    private var storedDatesHistoryTransactions = CurrentValueSubject<[String],Never>([])
    
    init () {
        updateHistoryData()
    }
    var password: String? {
        return getPasswordFromRepository()
    }
    var credentialsCard: CredentialsCardDomain? {
        return storageManager.fetchCredentialsCard()
    }
    var account:Double {
        guard let account = storageManager.fetchCredentialsCard()?.account else {fatalError("ammout problem")}
        return account
    }
    var historyTransactions: [String:[TransactionDomain]] {
        return storedHistoryTransactions
    }
    var datesHistoryTransactions: [String] {
        return storedDatesHistoryTransactions.value
    }
    var anyPublisherCountDatesHistoryTransactions: AnyPublisher<[String], Never> {
        return storedDatesHistoryTransactions.eraseToAnyPublisher()
    }
    private func getPasswordFromRepository() -> String? {
        guard let strPassword = storageManager.fetchCredentialsAuth()?.pass_code else {return nil}
        if let _ = Int(strPassword) {
            return strPassword
        }
        return nil
    }
    private func updateHistoryData() {
        let transactions = storageManager.fetchTransactions()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        for transaction in transactions {
            let date = transaction.date

            let keyDateForTransaction = formatter.string(from: date)
            if !storedDatesHistoryTransactions.value.contains(keyDateForTransaction) {
                storedDatesHistoryTransactions.value.append(keyDateForTransaction)
                storedHistoryTransactions[keyDateForTransaction] = []
            }
            storedHistoryTransactions[keyDateForTransaction]?.append(transaction)
        }
    }
}




















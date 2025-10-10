import Combine
import Foundation
protocol Domain {

    var password: String? {get}
    
    var credentialsCard: CredentialsCardDomain? {get}
    
    var account:Double {get}
  
    var historyTransactions: [String:[TransactionDomain]] {get}
    
    var datesHistoryTransactions: [String]? {get}
    
    var anyPublisherCountDatesHistoryTransactions: AnyPublisher<[String], Never>? {get}
    
}
class DomainImpl:Domain{
    var password: String? {}
    
    var credentialsCard: CredentialsCardDomain? {}
    
    var account:Double {}
  
    var historyTransactions: [String:[TransactionDomain]] {}
    
    var datesHistoryTransactions: [String]? {}
    
    var anyPublisherCountDatesHistoryTransactions: AnyPublisher<[String], Never>? {}
    
}








//private func updateHistoryData() {
//        let transactions = storageManager.fetchTransactions()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//        for transaction in transactions {
//            let date = transaction.date
//
//            let keyDateForTransaction = formatter.string(from: date)
//            if !storedDatesHistoryTransactions.value.contains(keyDateForTransaction) {
//                storedDatesHistoryTransactions.value.append(keyDateForTransaction)
//                storedHistoryTransactions[keyDateForTransaction] = []
//            }
//            storedHistoryTransactions[keyDateForTransaction]?.append(transaction)
//        }
//    }











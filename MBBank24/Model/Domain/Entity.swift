
final class CredentialsAuthDomain {
    init(pass_code: String? = nil, user_id: Int32) {
        self.pass_code = pass_code
        self.user_id = user_id
    }
    init(credentialsAuthCoreData: CredentialsAuth) {
        self.pass_code = credentialsAuthCoreData.pass_code
        self.user_id = credentialsAuthCoreData.user_id
    }
    var pass_code: String?
    var user_id: Int32 = 0
}

import Foundation
class TransactionDomain {
    
    var card_number: String
    var date: Date
    var status: Int16
    var location: String
    var merchant: String
    var type_merchant: Int16
    var amount: Double
    var operation_number: String
    init(transactionRepository: Transaction) {
        self.date = transactionRepository.date!
        self.card_number = transactionRepository.card_number!
        self.status = transactionRepository.status
        self.location = transactionRepository.location!
        self.merchant = transactionRepository.merchant!
        self.type_merchant = transactionRepository.type_merchant
        self.amount = transactionRepository.amount
        self.operation_number = transactionRepository.operation_number!
        
    }
}
enum MerchantType:Int16 {
    case foodDrinks = 1, MIA, restorrants, householdGoods, farmacie, beauty, others, tourisme

}
enum PaymentGadget:Int16 {
    case phone = 1, card = 2
}
enum StateTransaction: Int16 {
    case exectuing = 0, exectued = 1
}
struct CredentialsCardDomain {
    var cardNumber: String
    var expireDate: Date
    var cardType: CardType
    var holderName: String
    var account:Double
    init?(_ credentialsCard: CredentialsCard) {
        guard let cardNumber = credentialsCard.card_number, let expireDate = credentialsCard.expire_date, let holderName = credentialsCard.holder_name, let cardType = CardType(rawValue: Int(credentialsCard.card_type)) else {fatalError("CredentialsCard не полный")}
        self.cardNumber = cardNumber
        self.expireDate = expireDate
        self.cardType = cardType
        self.holderName = holderName
        self.account = credentialsCard.account
    }
    private func getStrigFrom(array:[Int]) -> String {
        var cardNumber:String = ""
        //array.forEach { cardNumber += String($0)}
        for (index,char) in array.enumerated() {
            if (index % 4 == 0 && index != 0) {
                cardNumber += " "
            }
            if (index >= 6 && index <= 11) {
                cardNumber += "*"
            }
            else {
                cardNumber += String(char)
            }
        }
        
        return cardNumber
    }
}

enum CardType:Int {
    case visa = 1, masterCard
}


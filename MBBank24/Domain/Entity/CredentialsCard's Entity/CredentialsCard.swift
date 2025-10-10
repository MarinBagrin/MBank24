import Foundation

struct CredentialsCardDomain {
    var cardNumber: String?
    var expireDate: Date?
    var cardType: CardType?
    var holderName: String?
    var account:Double?
    
    enum CardType:Int {
        case visa = 1, masterCard
    }
}

//    private func getStrigFrom(array:[Int]) -> String {
//        var cardNumber:String = ""
//        //array.forEach { cardNumber += String($0)}
//        for (index,char) in array.enumerated() {
//            if (index % 4 == 0 && index != 0) {
//                cardNumber += " "
//            }
//            if (index >= 6 && index <= 11) {
//                cardNumber += "*"
//            }
//            else {
//                cardNumber += String(char)
//            }
//        }
//
//        return cardNumber
//    }

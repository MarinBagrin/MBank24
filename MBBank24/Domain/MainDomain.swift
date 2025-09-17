import Combine
class MainDomain {
    //добавить кей чайн

    private var password = [0,2,0,0,3]
    private var credentialsCard = CredentialsCard()
    init () {
    }
    var getPassword: [Int] {
        return password
    }
    var getCredentialsCard: CredentialsCard {
        return credentialsCard
    }
    var getAccount:Int {
        return credentialsCard.account
    }
    
}

class CredentialsCard {
    var cardNumber: [Int] = [2,4,4,2, 1,6,2,2, 9,5,2,1, 4,2,4,6]
    var expTime: (year: Int, month: Int) = (2030, 2)
    var typeCard = CardType.visa
    var nameUser: (firstName: String, secondName: String) = ("Bagrin", "Marin")
    var account = 132590
}

enum CardType {
    case visa, masterCard
}

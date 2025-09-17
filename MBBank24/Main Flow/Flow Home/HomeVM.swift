import UIKit
import Combine

class HomeVM {
    private var mainDomain:MainDomain
    init(mainDomain:MainDomain, ) {
        self.mainDomain = mainDomain
    }
    var getAccount: Int {
        return mainDomain.getAccount
    }
    var getCredentialsCard: CredentialsCard {
        return mainDomain.getCredentialsCard
    }
}


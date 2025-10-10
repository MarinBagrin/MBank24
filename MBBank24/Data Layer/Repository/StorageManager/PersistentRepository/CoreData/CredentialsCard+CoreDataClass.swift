//
//  CredentialsCard+CoreDataClass.swift
//  MBBank24
//
//  Created by Marin Bagrin on 04.10.2025.
//
//

import Foundation
import CoreData

@objc(CredentialsCard)
public class CredentialsCard: NSManagedObject {}

extension CredentialsCard {

    @NSManaged public var card_number: String?
    @NSManaged public var expire_date: Date?
    @NSManaged public var holder_name: String?
    @NSManaged public var card_type: Int16
    @NSManaged public var account: Double

}

extension CredentialsCard : Identifiable {
    
}
extension CredentialsCard {
    func toCredentialsCardDomain() -> CredentialsCardDomain {
        var cardCredentialsDomain = CredentialsCardDomain()
        cardCredentialsDomain.cardNumber = self.card_number
        cardCredentialsDomain.expireDate = self.expire_date
        cardCredentialsDomain.cardType = CredentialsCardDomain.CardType(rawValue: Int(self.card_type))!
        cardCredentialsDomain.holderName = self.holder_name
        cardCredentialsDomain.account = self.account
        return cardCredentialsDomain
    }
}



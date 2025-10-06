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


//
//  Transaction+CoreDataProperties.swift
//  MBBank24
//
//  Created by Marin Bagrin on 23.09.2025.
//
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {

}


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var card_number: String?
    @NSManaged public var date: Date?
    @NSManaged public var status: Int16
    @NSManaged public var location: String?
    @NSManaged public var merchant: String?
    @NSManaged public var type_merchant: Int16
    @NSManaged public var amount: Double
    @NSManaged public var operation_number: String?
    @NSManaged public var payment_gadget: Int16

}

extension Transaction : Identifiable {

}

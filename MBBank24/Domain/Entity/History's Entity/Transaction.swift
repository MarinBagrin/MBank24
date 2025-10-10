//
//  TransactionDomain.swift
//  MBBank24
//
//  Created by Marin Bagrin on 09.10.2025.
//
import Foundation

struct TransactionDomain {
    var card_number: String?
    var date: Date?
    var status: Int16?
    var location: String?
    var merchant: String?
    var type_merchant: Int16?
    var amount: Double?
    var operation_number: String?

    enum MerchantType:Int16 {
        case foodDrinks = 1, MIA, restorrants, householdGoods, farmacie, beauty, others, tourisme
    }

    enum PaymentGadget:Int16 {
        case phone = 1, card = 2
    }

    enum StateTransaction: Int16 {
        case exectuing = 0, exectued = 1
    }
}

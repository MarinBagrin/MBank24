//
//  CredentialsAuth+CoreDataProperties.swift
//  MBBank24
//
//  Created by Marin Bagrin on 23.09.2025.
//
//

import Foundation
import CoreData

@objc(CredentialsAuth)
public class CredentialsAuth: NSManagedObject {

}

extension CredentialsAuth {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<CredentialsAuth> {
//        return NSFetchRequest<CredentialsAuth>(entityName: "CredentialsAuth")
//    }

    @NSManaged public var pass_code: String?
    @NSManaged public var user_id: Int32

}

extension CredentialsAuth : Identifiable {

}
extension CredentialsAuth  {
    func toCredentialsAuthDomain() -> CredentialsAuthDomain {
        return CredentialsAuthDomain(pass_code: pass_code,user_id: user_id)
    }
}

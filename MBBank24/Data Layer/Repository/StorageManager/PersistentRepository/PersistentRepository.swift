//MARK: PersistentManager

import UIKit
import CoreData
protocol PersistentRepository {
    func fetchTransactions() -> [TransactionDomain]
    func fetchCredentialsAuth() -> CredentialsAuthDomain?
    func fillForTheFirstTime()
    func fetchCredentialsCard() -> CredentialsCardDomain?
    func changePassword(passCode: String)
}
//MARK: CoreDataManager

class PersistentRepositoryImpl:PersistentRepository {
    init() {}
    private var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    //MARK: CredentialsCard
    func fetchCredentialsCard() -> CredentialsCardDomain? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CredentialsCard")
        do {
            guard let credentialsCard = try? (context.fetch(fetchRequest) as? [CredentialsCard])?.first else {fatalError("xyinea")}
            return credentialsCard.toCredentialsCardDomain()
        }
    }
    //MARK: Transactions
    func fillForTheFirstTime() {
        removeAllTransactions()
        for i in 0..<100 {
            if [3,5,7,12,14,16,32,25,51,42,65,23,54,65,76,98,12].contains(i) {
                continue
            }
            for _ in 0..<Int.random(in: 1..<6) {
                guard let transactionEntityDescription = NSEntityDescription.entity(forEntityName: "Transaction", in: context) else {fatalError("NSEntityDescription")}
                let transaction = Transaction(entity: transactionEntityDescription, insertInto: context)
                transaction.type_merchant = Int16([1,1,1,1,2,2,3,3,4,4,4,5,6,7,8].randomElement()!)
                switch TransactionDomain.MerchantType(rawValue: transaction.type_merchant) {
                case .foodDrinks:
                    transaction.merchant = ["FOU67","FOU67","MOLDRETAIL GROUP F109","MOLDRETAIL GROUP F109","MOLDRETAIL GROUP F109","VEGETARIANUL","NR 1 STEFAN CEL MARE"].randomElement()
                    transaction.amount = Double.random(in: 16..<314)
                case .others:
                    transaction.merchant = "APA PURA_STUDENTILOR"
                    transaction.amount = Double.random(in: 3..<9)
                case .MIA:
                    transaction.amount = Double.random(in: -10000..<20000)
                    transaction.merchant = transaction.amount < 0 ? "Transfer cu fonduri IPS" : ["Bonus","Transfer","Transfer","Transfer","Pay", "Banii ceia", "bani","multumesc","de ce?","ustdf",].randomElement()
                case .restorrants:
                    transaction.amount = Double.random(in: 231..<531)
                    transaction.merchant = ["Ovadenco"].randomElement()
                case .householdGoods:
                    transaction.amount = Double.random(in: 600..<11313)
                    transaction.merchant = ["DARWIN 222"].randomElement()
                case .farmacie:
                    transaction.amount = Double.random(in: 102..<453)
                    transaction.merchant = ["PRODIAFARM SRL"].randomElement()
                case .beauty:
                    transaction.amount = Double.random(in: 90..<200)
                    transaction.merchant = ["SOLVEX-LUX S.R.L"].randomElement()
                case .tourisme:
                    transaction.amount = Double.random(in: 6..<12)
                    transaction.merchant = ["RTEC"].randomElement()
                default: break
                }
                //var date = Date()
                let calendar = Calendar.current
                guard let dateForTransaction = calendar.date(byAdding: .day, value: -i, to: .now) else {fatalError("ошибка возникнуть не должно")}
                let updateDateForTransaction = calendar.date(byAdding: .hour, value: Int.random(in: 6..<23), to: dateForTransaction)
                transaction.date = updateDateForTransaction
                transaction.card_number = "4312 7512 4123 3123"
                transaction.location = "CHISINAU MDA"
                transaction.status = 1
                transaction.operation_number = String(Int.random(in: 100000000000..<900000000000))
                transaction.payment_gadget = 2
            }
        }
        appDelegate.saveContext()
    }
    private func removeAllTransactions() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Transaction")
        do {
            try? (context.fetch(fetch) as? [Transaction])?.forEach{
                context.delete($0)
            }
        }
    }
    func fetchTransactions() -> [TransactionDomain] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Transaction")
        do {
            let arrayTransactions = (try? context.fetch(fetchRequest) as? [Transaction]) ?? []
            return arrayTransactions.map {$0.toTransactionDomain()}
        }
    }
    //MARK: Transactions
    func changePassword(passCode: String) {
        deleteCredentialsAuth()
        guard let credentialsEntityDesciption = NSEntityDescription.entity(forEntityName: "CredentialsAuth", in: context) else {fatalError("NSEntityDescription")}
        let credentialsAuth = CredentialsAuth(entity: credentialsEntityDesciption, insertInto: context)
        credentialsAuth.pass_code = passCode
        appDelegate.saveContext()
    }
    private func deleteCredentialsAuth() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CredentialsAuth")
        do {
            let credentialsAuth = (try? context.fetch(fetchRequest) as? [CredentialsAuth])
            credentialsAuth?.forEach{context.delete($0)}
        }
    }
    func fetchCredentialsAuth() -> CredentialsAuthDomain?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CredentialsAuth")
        do {
            guard let credentialsAuth = (try? context.fetch(fetchRequest) as? [CredentialsAuth])?.first else {return nil}
            return credentialsAuth.toCredentialsAuthDomain()
        }
    }
//    public func fetchCredentials(_ id: Int) -> Credentials? {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Credentials")
//        do {
//            let credentials = try? context.fetch(fetchRequest) as? [Credentials]
//            return credentials?.first { return $0.id == id }
//        }
//    }
}

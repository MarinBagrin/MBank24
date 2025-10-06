//
//  StorgaeManager.swift
//  MBBank24
//
//  Created by Marin Bagrin on 22.09.2025.
//
import UIKit
import CoreData
//CRUD
//MARK: - StorageManager
protocol StorgaeManager {
    func fetchTransactions() -> [TransactionDomain]
    func fetchCredentialsAuth() -> CredentialsAuthDomain?
    func fetchCredentialsCard() -> CredentialsCardDomain?
}

final class StorageManagerImpl:StorgaeManager {
    private let persistentManager: PersistentManager = CoreDataManager()
    private let networkManager: NetworkManager = NetworkManagerImpl()
    private let chaceManager: ChaceStorageManager
    
    init() {
        self.chaceManager = ChaceStorageManagerImpl(networkManager: networkManager)
        persistentManager.fillForTheFirstTime()

    }
    func fetchTransactions() -> [TransactionDomain] {
        return persistentManager.fetchTransactions()
    }
    func fetchCredentialsAuth() -> CredentialsAuthDomain? {
        return persistentManager.fetchCredentialsAuth()
    }
    func fetchCredentialsCard() -> CredentialsCardDomain? {
        return persistentManager.fetchCredentialsCard()
    }

}


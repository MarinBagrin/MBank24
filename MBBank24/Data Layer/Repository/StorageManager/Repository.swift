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

final class RepositoryImpl {
    private let persistentRepository: PersistentRepository
    private let chacheRepository: ChacheRepository

    init(chacheRepository:ChacheRepository,
         persistentRepository:PersistentRepository) {
        self.chacheRepository = chacheRepository
        self.persistentRepository = persistentRepository

    }
}

protocol RepositoryHistory {
    func fetchTransactions() -> [TransactionDomain]
}
extension RepositoryImpl:RepositoryHistory {
    func fetchTransactions() -> [TransactionDomain] {
        return persistentRepository.fetchTransactions()
    }
}

protocol RepositoryAuth {
    func fetchCredentialsAuth() -> CredentialsAuthDomain?
    func changePassword(passCode: String)
}

extension RepositoryImpl:RepositoryAuth {
    func fetchCredentialsAuth() -> CredentialsAuthDomain? {
        return persistentRepository.fetchCredentialsAuth()
    }
    func changePassword(passCode: String) {
        persistentRepository.changePassword(passCode: passCode)
    }
}

protocol RepositoryCredentialsCard {
    func fetchCredentialsCard() -> CredentialsCardDomain?
}
extension RepositoryImpl:RepositoryCredentialsCard {
    func fetchCredentialsCard() -> CredentialsCardDomain? {
        return persistentRepository.fetchCredentialsCard()
    }
}

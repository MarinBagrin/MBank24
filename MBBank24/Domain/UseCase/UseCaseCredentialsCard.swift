//
//  UseCaseCredentialsCard.swift
//  MBBank24
//
//  Created by Marin Bagrin on 10.10.2025.
//

protocol CredentialsCardUseCase {
    var credentialsCard: CredentialsCardDomain{ get }
    var account: Double { get }
}
class CredentialsCardUseCaseImpl: CredentialsCardUseCase {
    private let repository: RepositoryCredentialsCard
    init(repository: RepositoryCredentialsCard) {
        self.repository = repository
    }
    var credentialsCard: CredentialsCardDomain {
    }
    var account: Double  {
    }
}

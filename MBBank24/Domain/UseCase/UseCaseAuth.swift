//
//  UseCaseAuth.swift
//  MBBank24
//
//  Created by Marin Bagrin on 09.10.2025.
//

protocol UseCaseAuth {
    var password: String? { get }
    func changePassword(_ password: String)
}
class UseCaseAuthImpl: UseCaseAuth {
    private let repository: RepositoryAuth
    init(repository: RepositoryAuth) {
        self.repository = repository
    }
    var password: String? {
        if let intPass = Int(repository.fetchCredentialsAuth()?.pass_code ?? "nil") {
         return String(intPass)
        }
        print("error:0 - passCode is not from Digit")
        return nil
    }
    func changePassword(_ passCode: String) {
        repository.changePassword(passCode: passCode)
    }
}

//
//  CredentialsAuth.swift
//  MBBank24
//
//  Created by Marin Bagrin on 09.10.2025.
//

struct CredentialsAuthDomain {
    var pass_code: String?
    var user_id: Int32 = 0
    init(pass_code: String? = nil, user_id: Int32) {
        self.pass_code = pass_code
        self.user_id = user_id
    }
}


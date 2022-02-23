//
//  AuthData.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 21.02.2022.
//

public struct AuthData: Codable {
    public let accessToken: String?
    public let tokenType: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

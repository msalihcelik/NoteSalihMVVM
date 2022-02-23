//
//  Auth.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 21.02.2022.
//

public struct Auth: Codable {
    public let code: String?
    public let data: AuthData?
    public let message: String?
}

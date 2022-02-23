//
//  ForgotPassword.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

public struct ForgotPassword: Codable {
    public let code: String?
    public let data: AuthData?
    public let message: String?
}

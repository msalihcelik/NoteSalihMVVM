//
//  GetUserResponse.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

public struct GetUserResponse: Decodable {
    public let code: String?
    public let data: User?
    public let message: String?
}

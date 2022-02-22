//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 21.02.2022.
//

public struct RegisterRequest: ApiDecodableResponseRequest {

    public typealias ResponseType = Auth

    public let path: String = "auth/register"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]

    public init(fullName: String, email: String, password: String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
        parameters["password"] = password
    }
}

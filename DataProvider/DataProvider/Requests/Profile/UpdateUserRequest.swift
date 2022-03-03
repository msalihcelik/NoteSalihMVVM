//
//  UpdateUserRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

public struct UpdateUserRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetUserResponse
    
    public let path: String = "users/me"
    public let method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(fullName: String, email: String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
    }
}

//
//  GetUserRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

public struct GetUserRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetUserResponse
    
    public let path: String = "users/me"
    public let method: RequestMethod = .get
    public let parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init() {}
}

//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 21.02.2022.
//

public struct LoginRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public let path: String = "auth/login"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
  public init(email: String, password: String) {
      parameters["email"] = email
      parameters["password"] = password
    }
    
}

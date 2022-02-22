//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

public struct ForgotPasswordRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = ForgotPassword
    
    public let path: String = "auth/forgot-password"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
}

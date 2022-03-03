//
//  ChangePasswordRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

public struct ChangePasswordRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = ChangePasswordResponse
    
    public let path: String = "users/me/password"
    public let method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(password: String, newPassword: String, newPasswordConfirmation: String) {
        parameters["password"] = password
        parameters["new_password"] = newPassword
        parameters["new_password_confirmation"] = newPasswordConfirmation
    }
}

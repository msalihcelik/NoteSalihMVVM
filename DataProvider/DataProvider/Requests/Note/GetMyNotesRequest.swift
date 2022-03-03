//
//  GetMyNotesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 25.02.2022.
//

public struct GetMyNotesRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetMyNotesResponse
    
    public let path: String = "users/me/notes"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(page: Int) {
        parameters["page"] = page
    }
}

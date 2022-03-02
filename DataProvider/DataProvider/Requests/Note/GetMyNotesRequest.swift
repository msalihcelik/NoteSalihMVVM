//
//  GetMyNotesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 25.02.2022.
//

public struct GetMyNotesRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetMyNotesResponse
    
    public var path: String = "users/me/notes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
        parameters["page"] = page
    }
}

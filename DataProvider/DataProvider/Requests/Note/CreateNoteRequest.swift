//
//  CreateNoteRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 27.02.2022.
//

public struct CreateNoteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = CreateNoteResponse
    
    public let path: String = "notes"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(title: String, description: String) {
        parameters["title"] = title
        parameters["note"] = description
    }
}

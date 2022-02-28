//
//  CreateNoteRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 27.02.2022.
//

public struct CreateNoteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = CreateNoteResponse
    
    public var path: String = "notes"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(title: String, description: String) {
        parameters["title"] = title
        parameters["note"] = description
    }
}

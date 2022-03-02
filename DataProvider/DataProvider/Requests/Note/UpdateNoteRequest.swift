//
//  UpdateNoteRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 27.02.2022.
//

public struct UpdateNoteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = UpdateNoteResponse
    
    public let path: String
    public let method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(title: String, description: String, id: Int) {
        parameters["title"] = title
        parameters["note"] = description
        path = "notes/\(id)"
    }
}

//
//  UpdateNoteRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 27.02.2022.
//

public struct UpdateNoteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = UpdateNoteResponse
    
    public var path: String
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(title: String, description: String, id: Int) {
        parameters["title"] = title
        parameters["note"] = description
        path = "notes/\(id)"
    }
}

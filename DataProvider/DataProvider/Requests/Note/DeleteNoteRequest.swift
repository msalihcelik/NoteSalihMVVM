//
//  DeleteNoteRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 26.02.2022.
//

public struct DeleteNoteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public let path: String
    public let method: RequestMethod = .delete
    public let parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(id: Int) {
        path = "notes/\(id)"
    }
}

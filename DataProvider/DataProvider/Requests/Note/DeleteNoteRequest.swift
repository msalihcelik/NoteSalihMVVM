//
//  DeleteNoteRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 26.02.2022.
//

public struct DeleteNoteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public var path: String
    public var method: RequestMethod = .delete
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(id: Int) {
        path = "notes/\(id)"
    }
}

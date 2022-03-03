//
//  CreateNoteResponse.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

public struct CreateNoteResponse: Decodable {
    public let code: String?
    public let data: Note?
    public let message: String?
}

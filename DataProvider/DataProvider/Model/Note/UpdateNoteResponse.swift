//
//  UpdateNoteResponse.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 27.02.2022.
//

public struct UpdateNoteResponse: Decodable {
    public let code: String?
    public let data: Note
    public let message: String?
}

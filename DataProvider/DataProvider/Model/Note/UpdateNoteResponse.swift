//
//  UpdateNoteResponse.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 27.02.2022.
//

public struct UpdateNoteResponse: Codable {
    public let code: String?
    public let data: Note
    public let message: String?
}

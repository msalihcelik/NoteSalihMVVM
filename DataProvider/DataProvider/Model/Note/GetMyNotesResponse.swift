//
//  GetMyNotesResponse.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 26.02.2022.
//

public struct GetMyNotesResponse: Decodable {
    public let code: String?
    public let data: Notes
    public let message: String?
}

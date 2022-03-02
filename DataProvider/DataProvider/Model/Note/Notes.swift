//
//  Notes.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 26.02.2022.
//

public struct Notes: Codable {
    public let currentPage: Int
    public let data: [Note]
    public let lastPage: Int

    public enum CodingKeys: String, CodingKey {
             case currentPage = "current_page"
             case data
             case lastPage = "last_page"
         }
}

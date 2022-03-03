//
//  User.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

public struct User: Decodable {
    public var fullName: String?
    public var email: String?
    public var id: Int?
    
    public init(fullName: String, email: String, id: Int) {
        self.fullName = fullName
        self.email = email
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email
        case id
    }
}

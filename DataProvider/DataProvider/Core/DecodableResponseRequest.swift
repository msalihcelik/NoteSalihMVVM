//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 11.02.2022.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}

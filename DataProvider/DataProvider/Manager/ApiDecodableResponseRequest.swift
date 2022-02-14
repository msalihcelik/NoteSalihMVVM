//
//  ApiDecodableResponseRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih ÇELİK on 14.02.2022.
//

public protocol ApiDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension ApiDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - url
public extension ApiDecodableResponseRequest {
    var url: String {
        return "https://notesalihmvvm.herokuapp.com/api/" + path
    }
}

// MARK: - RequestParameters
public extension ApiDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension ApiDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}

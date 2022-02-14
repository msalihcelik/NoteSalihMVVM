//
//  ApiRequestInterceptor.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 14.02.2022.
//

import Alamofire

public class ApiRequestInterceptor: RequestInterceptor {
    
    public static let shared = ApiRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let accessToken: String? = ""
        
        if let accessToken = accessToken {
            urlRequest.headers.add(name: "token", value: accessToken)
        }

        completion(.success(urlRequest))
    }
}


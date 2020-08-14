//
//  APIClient.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import Combine

struct APIClient {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        print("here")
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() 
    }
}

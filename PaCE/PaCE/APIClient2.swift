//
//  APIClient2.swift
//  PaCE
//
//  Created by Jason Dale on 8/20/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

// TODO: caching https://www.swiftbysundell.com/articles/caching-in-swift/

enum ApiError: Error {
    case decode
    case serverError
}

class API {
    private let baseUrl = "https://pace-api.jasondale.me/api/"
    func call<T: Codable>(endpoint: String, method: String, payload: T? = nil, completion: @escaping (Result<T, ApiError>) -> Void) {
        // Config
//        let formatter = ISO8601DateFormatter()
//        let formatter = DateFormatter()
//        formatter.dateFormat = ISO8601DateFormatter
//        2020-12-24T09:37:47-05:00
//        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.dateDecodingStrategy = .iso8601

        guard let url = URL(string: baseUrl+endpoint) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = method
        print(request.httpMethod as Any)
        if method != "GET" {
            guard let encoded = try? JSONEncoder().encode(payload) else {
                completion(.failure(.decode))
                return
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = encoded
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(data as Any)
            print(response as Any)
            if let error = error {
                print("Error fetching data: \(error)")
                completion(.failure(.serverError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                completion(.failure(.serverError))
                return
            }
            if method == "DELETE" {
                completion(.success(payload!))
            } else {
                let returnData: T = try! decoder.decode(T.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(returnData))
                }
            } 
        }
        .resume()
    }
}

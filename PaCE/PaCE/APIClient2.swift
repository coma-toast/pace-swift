//
//  APIClient2.swift
//  PaCE
//
//  Created by Jason Dale on 8/20/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

// TODO: caching https://www.swiftbysundell.com/articles/caching-in-swift/

class API {
    private let baseUrl = "https://pace-api.jasondale.me/api/"
    func call<T: Codable>(endpoint: String, method: String, payload: T? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: baseUrl+endpoint) else {return}
        var request = URLRequest(url: url)
        if payload != nil {
            guard let encoded = try? JSONEncoder().encode(payload) else {
                print("Failed to encode payload")
                return
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = method
            request.httpBody = encoded
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    return
            }
            let returnData: T = try! JSONDecoder().decode(T.self, from: data!)
            DispatchQueue.main.async {
                completion(.success(returnData))
            }
        }
        .resume()
    }
}

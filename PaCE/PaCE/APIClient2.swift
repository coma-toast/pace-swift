//
//  APIClient2.swift
//  PaCE
//
//  Created by Jason Dale on 8/20/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

class API {
    func call(endpoint: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: endpoint) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
              print("Error fetching data: \(error)")
              return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
              return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        .resume()
    }
}

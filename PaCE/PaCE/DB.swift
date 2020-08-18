//
//  DB.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import Combine

enum DB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://pace-api.jasondale.me/api/")!
}
    
enum APIPath: String {
    case allContacts = "contact"
}

extension DB {
    static func request(_ path: APIPath) -> AnyPublisher<Contacts, Error> {
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
//        components.queryItems = [URLQueryItem(name: "api_key", value: "your_api_key_here")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() //
    }
    
}

//
//  ContactResponse.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation

struct ContactResponse: Codable {
    let contacts: [Contact]
    
    enum CodingKeys: String, CodingKey {
        case contacts = ""
    }
}

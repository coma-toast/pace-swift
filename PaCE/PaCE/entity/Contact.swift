//
//  Contact.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation

struct Contact: Codable, Identifiable {
    let id: String
    let created: String
    let firstName: String
    let lastName: String
    let company: String
    let email: String
    let phone: String
    let timezone: String
    let instance: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case created = "created"
        case firstName = "firstName"
        case lastName = "lastName"
        case company = "company"
        case email = "email"
        case phone = "phone"
        case timezone = "timezone"
        case instance = "instance"
    }
}

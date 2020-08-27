//
//  Contact.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation

struct Contacts: Codable {
    let contacts: [Contact]
}

struct Contact: Codable, Identifiable {
    var id: String = ""
    var created: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var company: String = ""
    var email: String = ""
    var phone: String = ""
    var timezone: String = ""
//    var isFavorite: Bool = false
    var instance: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case created = "created"
        case firstName = "firstname"
        case lastName = "lastname"
        case company = "company"
        case email = "email"
        case phone = "phone"
        case timezone = "timezone"
//        case isFavorite = "isfavorite"
        case instance = "instance"
    }
}

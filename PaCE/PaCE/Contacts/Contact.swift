//
//  Contact.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ContactStore: ObservableObject {
    @Published var contacts: [Contact] = []
    init() {
        contacts.append(Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1"))
        contacts.append(Contact(id: "1", created: "123", firstName: "Joe", lastName: "Schmoe", company: "Company ABC", email: "jschmoe@123", phone: "1234", timezone: "edt", instance: "1"))

    }
    
    func orderByLastname() {
        contacts.sort { $0.lastName < $1.lastName }
    }
    
    func orderByFirstname() {
        contacts.sort { $0.firstName < $1.firstName }
    }
//    func removeCompleted() {
//        todos.removeAll { $0.isDone }
//    }

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

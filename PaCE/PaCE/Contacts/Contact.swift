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
    @Published var isLoading:Bool = false
    init() {
//        contacts.append(Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1"))
//        contacts.append(Contact(id: "1", created: "123", firstName: "Joe", lastName: "Schmoe", company: "Company ABC", email: "jschmoe@123", phone: "1234", timezone: "edt", instance: "1"))
        getAllContacts()
    }
    
    func orderByLastname() {
        contacts.sort { $0.lastName < $1.lastName }
    }
    
    func orderByFirstname() {
        contacts.sort { $0.firstName < $1.firstName }
    }
    
    func getAllContacts(){
        isLoading = true
        let payloadData: [Contact] = [Contact]()
        
        API().call(endpoint: "contact", method: "GET", payload: payloadData) { result in
            switch result {
            case .success(let contacts):
                print(contacts)
                self.contacts = contacts
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
    
    func updateContact(contact: Contact) {
        API().call(endpoint: "contact", method: "POST", payload: contact) { result in
            switch result {
            case .success(let updatedContact):
                if let row = self.contacts.firstIndex(where: {$0.id == updatedContact.id}) {
                    self.contacts[row] = updatedContact
                }
                print("Contact \(updatedContact.firstName) \(updatedContact.lastName) updated.")
            case .failure(let error):
                print(error)
            }
        }
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

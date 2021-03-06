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
        getAllContacts()
    }
    
    func orderByLastname() {
        contacts.sort { $0.lastName < $1.lastName }
    }
    
    func orderByFirstname() {
        contacts.sort { $0.firstName < $1.firstName }
    }
    
    func getAllContacts(){
        DispatchQueue.main.async {
            self.isLoading = true
            let payloadData: [Contact] = [Contact]()

            API().call(endpoint: "contact", method: "GET", payload: payloadData) { result in
                switch result {
                case .success(let contacts):
                    // dev code
                    print(contacts)
                    self.contacts = contacts
                    self.isLoading = false
                case .failure(let error):
                    // dev code
                    print(error)
                    self.isLoading = false
                }
            }
        }
    }

    func getCachedContactByID(id: String) {
        ForEach(contacts.indexed(), id: \.self) { index in
            if id == index {
                return contacts[index]
            }
        }
    }

    // TODO: I am here. start building out Company, then make this function, then finish ProjectAdd so I can link a company
    func getContactsByCompany(company: Company) {
        // TODO: this
    }
    
    func updateContact(contact: Contact) {
        isLoading = true
        API().call(endpoint: "contact", method: "POST", payload: contact) { result in
            switch result {
            case .success(let updatedContact):
                if let row = self.contacts.firstIndex(where: {$0.id == updatedContact.id}) {
                    self.contacts[row] = updatedContact
                }
                // dev code
                print("Contact \(updatedContact.firstName) \(updatedContact.lastName) updated.")
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
    
    func addContact(contact: Contact) {
        isLoading = true
        API().call(endpoint: "contact", method: "PUT", payload: contact) { result in
            switch result {
            case .success(let updatedContact):
                self.getAllContacts()
                if self.contacts.firstIndex(where: {$0.id == updatedContact.id}) != nil {
                    
                    // dev code
                    print("Contact \(updatedContact.firstName) \(updatedContact.lastName) added.")
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func deleteContactPermanently(contact: Contact) {
        isLoading = true
        API().call(endpoint: "contact", method: "DELETE", payload: contact) { result in
            switch result {
            case .success(let status):
                self.getAllContacts()
                if self.contacts.firstIndex(where: {$0.id == contact.id}) == nil {
                    // dev code
                    print("Result: \(status). Contact \(contact.firstName) \(contact.lastName) deleted.")
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func deleteContact(contact: Contact) {
        isLoading = true
        var contactToDelete = contact
        contactToDelete.deleted = true
        API().call(endpoint: "contact", method: "POST", payload: contactToDelete) { result in
            switch result {
            case .success(let deletedContact):
                self.getAllContacts()
                if deletedContact.deleted == true {
                    // dev code
                    print("Contact \(contact.firstName) \(contact.lastName) deleted.")
                }
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
}

struct Contact: Codable, Identifiable, Hashable {
    var id: String = ""
    var created: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var company: String = ""
    var email: String = ""
    var phone: String = ""
    //    var timezone: String = ""
    var favorite: Bool = false
    var deleted: Bool = false
    var instance: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case created = "created"
        case firstName = "firstname"
        case lastName = "lastname"
        case company = "company"
        case email = "email"
        case phone = "phone"
        //        case timezone = "timezone"
        case favorite = "favorite"
        case deleted = "deleted"
        case instance = "instance"
    }
}

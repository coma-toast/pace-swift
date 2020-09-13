//
//  ContactViewModel.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import Combine

class ContactViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    init() {
//        $contacts.sink(receiveValue: )
    }
    
    func getAllContacts(){
        let payloadData: [Contact] = [Contact]()
        
        API().call(endpoint: "contact", method: "GET", payload: payloadData) { result in
            switch result {
            case .success(let contacts):
                print(contacts)
                self.contacts = contacts
            case .failure(let error):
                print(error)
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
}


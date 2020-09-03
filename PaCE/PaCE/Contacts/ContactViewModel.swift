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
    @Published private(set) var contacts = [Contact]()
    @Published private var cancellable: Cancellable?
    
    //    init() {
    //        getContacts()
    //    }
    //
    func getAllContacts() {
        API().call(endpoint: "contact", method: "GET", completion:  {contacts in
            self.contacts = contacts as! [Contact]
            //            do {
            //                self.contacts = try JSONDecoder().decode([Contact].self, from: data!)
            //
            //            }
            //            catch {
            //                print("Error getting contacts: \(error)")
            //            }
        })
    }
    
    func updateContact(contact: Contact) -> Contact{
        
        API().call(endpoint: "contact", method: "POST", payload: contact, completion: {data in
            
            //            do {
            //                return try JSONDecoder().decode(Contact.self, from: data!)
            //            }
            //            catch {
            //                print("Error getting updated contact")
            //            }
        })
    }
}

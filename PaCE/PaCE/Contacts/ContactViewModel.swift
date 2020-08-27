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
    @Published var contacts: [Contact] = []
    
    init() {
        getContacts()
    }
    
    func getContacts() {
        API().call(endpoint: "https://pace-api.jasondale.me/api/contact", completion: {data  in
            do {
                self.contacts = try JSONDecoder().decode([Contact].self, from: data!)
                
            }
            catch {
                print("Error getting contacts: \(error)")
            }
        })
    }
}

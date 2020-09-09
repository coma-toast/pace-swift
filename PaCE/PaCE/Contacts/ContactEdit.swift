//
//  ContactEdit.swift
//  PaCE
//
//  Created by Jason Dale on 9/8/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ContactEdit: View {
    let contact: Contact
    var labels: [String] = [String]()
    var data: [String] = [String]()
    init(contact: Contact) {
        self.contact = contact
        self.data = []
        self.labels = []
        reflectProperties(contact: contact)
    }
    
    
    var body: some View {
        VStack {
            EditView(labels: labels, data: data)
            Spacer()
        }
    }
    mutating func reflectProperties(contact: Contact) {
        let mirror = Mirror(reflecting: contact)
        
        for child in mirror.children {
            
            if child.label != Optional("instance"), child.label != Optional("id"), child.label != Optional("created") {
                
                self.labels.append(String.titleCase(child.label ?? "")())
                self.data.append(child.value as! String)
            }
        }
    }
}


struct ContactEdit_Previews: PreviewProvider {
    static var contact = Contact(id: "1234", created: "june 1st 2020", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
    static var previews: some View {
        ContactEdit(contact: contact)
    }
}

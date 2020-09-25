//
//  ContactDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/22/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ContactDetail: View {
    let contact: Binding<Contact>
    var labels: [String] = []
    var data: [String] = []
    init(contact: Binding<Contact>) {
        self.contact = contact
//        self.labels = labels
//        self.data = data
        reflectProperties(contact: contact.wrappedValue)
    }
    
    
    var body: some View {
        VStack {
            DetailView(labels: labels, data: data)
            NavigationLink(destination: ContactEdit(contact: contact.wrappedValue)) {
                Text("Edit")
            }
            Spacer()
        }.navigationBarTitle(contact.wrappedValue.firstName + " " + contact.wrappedValue.lastName)
    }
    mutating func reflectProperties(contact: Contact) {
        let mirror = Mirror(reflecting: contact)
        
        for child in mirror.children {
            if child.label != Optional("instance"), child.label != Optional("id") {
                self.labels.append(String.titleCase(child.label ?? "")())
                self.data.append(child.value as! String)
            }
        }
    }
}

//        "id",
//        "created",
//        "firstname",
//        "lastname",
//        "company",
//        "email",
//        "phone",
//        "timezone",
//        "isfavorite",
//        "instance",
//    ]

//
struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State(initialValue:  Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")) var contact: Contact
        
        var body: some View {
            ContactDetail(contact: $contact)
        }
    }
}

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
    @State private var labels: [String] = []
    @State private var data: [String] = []
    init(contact: Binding<Contact>) {
        print("init")
        self.contact = contact
//        _labels = State(initialValue: ["init"])
//        print($labels)
        reflectProperties(contact: contact.wrappedValue)
    }
    
    
    var body: some View {
        VStack {
            ContactView.FullName(contact: contact)
            ForEach(labels.indices, id: \.self) { i in
                Text(self.labels[i])
            }
            DetailView(labels: labels, data: data)
            NavigationLink(destination: ContactEdit(contact: contact.wrappedValue)) {
                Text("Edit")
            }
            Spacer()
        }
    }
    mutating func reflectProperties(contact: Contact) {
        print("here")
//        print(contact)
        let mirror = Mirror(reflecting: contact)
        
        for child in mirror.children {
            if child.label != Optional("instance"), child.label != Optional("id") {
                self.labels.append(String.titleCase(child.label ?? "")())
                self.data.append(child.value as! String)
            }
        }
        print(self.labels)
        self.labels.append("test")
        print(self.labels)
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

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
    @Binding var contact: Contact
    @State var labels: [String] = [String]()
    @State var data: [String] = [String]()
//    init(contact: Contact) {
////        self.contact = contact
//        self.data = []
//        self.labels = []
//        reflectProperties(contact: contact)
//    }
    
    
    var body: some View {
        VStack {
            DetailView(labels: $labels, data: $data)
            NavigationLink(destination: ContactEdit(contact: contact)) {
                Text("Edit")
            }
            Spacer()
        }
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


//struct ContactDetail_Previews: PreviewProvider {
//    //    let contacts = ContactViewModel()
//    static var contact = Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
//
//    static var previews: some View {
////        ContactDetail(Binding: contact)
//    }
//}


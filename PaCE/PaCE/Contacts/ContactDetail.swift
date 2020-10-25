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
    let hiddenFields: [String] = ["instance", "id", "favorite", "deleted"]
    @EnvironmentObject var contactDatastore: ContactStore
    @State var showEditSheet = false
    init(contact: Binding<Contact>) {
        self.contact = contact
        reflectProperties(contact: contact.wrappedValue)
    }
    
    
    var body: some View {
        VStack {
            DetailView(labels: labels, data: data)
            //            NavigationLink(destination: ContactEdit(contact: contact.wrappedValue)) {
            //                Text("Edit")
            //            }
            Spacer()
            
        }
        .navigationBarTitle(contact.wrappedValue.firstName + " " + contact.wrappedValue.lastName)
        .navigationBarItems(trailing: editContactSheet(showEditSheet: self.$showEditSheet, contact: contact).environmentObject(contactDatastore))
    }
    mutating func reflectProperties(contact: Contact) {
        let mirror = Mirror(reflecting: contact)
        
        for child in mirror.children {
            if let currentLabel = child.label {
                if !hiddenFields.contains(currentLabel) {
                    // TODO: get better date formatting.
                    //                if child.label == Optional("created") {
                    //                    child.value = Text(child.value, style: Text.DateStyle)
                    //                }
                    self.labels.append(String.titleCase(child.label ?? "")())
                    self.data.append(child.value as! String)
                }
            }
        }
    }
}

struct editContactSheet: View {
    @Binding var showEditSheet: Bool
    @Binding var contact: Contact
    @EnvironmentObject var contactDatastore: ContactStore
    var body: some View {
        HStack {
            Button(action: {
                self.showEditSheet.toggle()
            }) {
                Image(systemName: "pencil")
            }.sheet(isPresented: $showEditSheet) {
                NavigationView {
                    ContactEdit(showEditSheet: $showEditSheet, contact: contact)
                        .environmentObject(contactDatastore)



                        .navigationBarItems(trailing: Button(action: {self.showEditSheet = false}, label: {Text("Done")}))
                        .navigationBarTitle("Edit")
                }
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
        @State(initialValue:  Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", instance: "1")) var contact: Contact
        
        var body: some View {
            ContactDetail(contact: $contact)
        }
    }
}

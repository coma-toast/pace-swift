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
    let contact: Binding<Contact>
    @EnvironmentObject var contactDatastore: ContactStore
    //    var labels: [String] = [String]()
    //    var data: [String] = [String]()
    //    init(contact: Contact) {
    //        self.contact = contact
    //        self.data = []
    //        self.labels = []
    //        reflectProperties(contact: contact)
    //    }
    
    
    var body: some View {
        VStack {
            //            EditView(labels: labels, data: data)
            Form {
                HStack {
                    Text("First Name")
                    TextField("First Name", text: contact.firstName)
                }
                Spacer()
                Button(action: {
                    self.contactDatastore.updateContact(contact: self.contact.wrappedValue)
                    //                    self.sendUpdatedData(contact: self.contact)
                }) {
                    Text("Submit")
                }
            }.navigationBarTitle("Edit")
            Spacer()
            
        }
    }
    //    func sendUpdatedData(contact: Contact) {
    //        API().call(endpoint: "contact", method: "POST", payload: contact) { result in
    //            switch result {
    //            case .success(let contact):
    //                print(contact)
    //                self.contact = contact
    //            case .failure(let error):
    //                print(error)
    //            }
    //        }
    //    }
    //    mutating func reflectProperties(contact: Contact) {
    //        let mirror = Mirror(reflecting: contact)
    //
    //        for child in mirror.children {
    //
    //            if child.label != Optional("instance"), child.label != Optional("id"), child.label != Optional("created") {
    //
    //                self.labels.append(String.titleCase(child.label ?? "")())
    //                self.data.append(child.value as! String)
    //            }
    //        }
    //    }
}


//struct ContactEdit_Previews: PreviewProvider {
//    static var contact: Binding<Contact> = Binding<Contact>(id: "1234", created: "june 1st 2020", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
//    static var previews: some View {
//        ContactEdit(contact: contact)
//    }
//}

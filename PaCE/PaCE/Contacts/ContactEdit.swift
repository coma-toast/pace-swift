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
    @State var contact: Contact
    @EnvironmentObject var contactDatastore: ContactStore
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                // TODO: EditView(labels: labels, data: data)
                Form {
                    HStack {
                        Text("First Name").bold()
                        TextField("First Name", text: $contact.firstName)
                    }
                    HStack {
                        Text("Last Name").bold()
                        TextField("Last Name", text: $contact.lastName)
                    }
                    HStack {
                        Text("Company").bold()
                        TextField("Company", text: $contact.company)
                    }
                    HStack {
                        Text("Email").bold()
                        TextField("Email", text: $contact.email)
                    }
                    HStack {
                        Text("Phone").bold()
                        TextField("Phone", text: $contact.phone)
                    }
                    Button(action: {
                        self.contactDatastore.updateContact(contact: self.contact)
                    }) {
                        Text("Submit").bold().fontWeight(.heavy)
                    }
                }.background(Color.green)
                Spacer()
            }
            //.background(Color.red) // dev code
            .blur(radius: self.contactDatastore.isLoading ? 3 : 0)
            if self.contactDatastore.isLoading {
                ContactLoadingView()
            }
        }.navigationBarTitle("Edit")
    }
}

//struct ContactEdit_Previews: PreviewProvider {
//    static var contact: Binding<Contact> = Binding<Contact>(id: "1234", created: "june 1st 2020", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
//    static var previews: some View {
//        ContactEdit(contact: contact)
//    }
//}

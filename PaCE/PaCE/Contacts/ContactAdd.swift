//
//  ContactAdd.swift
//  PaCE
//
//  Created by Jason Dale on 9/8/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ContactAdd: View {
    @Binding var showAddSheet: Bool
    @State var contact: Contact = Contact()
    @EnvironmentObject var contactDatastore: ContactStore
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    // TODO: EditView(labels: labels, data: data)
                    // TODO: Form validation (not empty fields)
                    Form {
                        HStack {
                            Text("First Name").bold()
                            TextField("First Name", text: $contact.firstName).font(.body)
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
                    }
                    Spacer()
                }.background(Color.red)
                .blur(radius: self.contactDatastore.isLoading ? 3 : 0)
                if self.contactDatastore.isLoading {
                    ContactLoadingView()
                }
            }
            
            .navigationBarTitle(Text("Add Contact"), displayMode: .inline)
            
            .navigationBarItems(trailing: Button(action: {self.showAddSheet = false}, label: {
                Text("Done")
            }))
            .toolbar(content: {
                
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button("Reset") {
                            self.contact = Contact()
                        }
                        .background(Color.black)
                        .buttonStyle(PlainButtonStyle())
                        
                        Button("Submit") {
                            self.contactDatastore.addContact(contact: self.contact)
                            self.showAddSheet = false
                        }
                    }
                    
                }
            })
        }
    }
}

//struct ContactAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactAdd(Binding)
//    }
//}

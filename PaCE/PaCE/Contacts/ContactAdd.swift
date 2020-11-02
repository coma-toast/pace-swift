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
                        FormItemText(title:"First Name", inputField: $contact.firstName)
                        FormItemText(title:"Last Name", inputField: $contact.lastName)
                        FormItemText(title:"Company", inputField: $contact.company)
                        FormItemText(title:"Email", inputField: $contact.email)
                        FormItemText(title:"Phone", inputField: $contact.phone)

                        //                        HStack {
                        //                            Text("Timezome").bold()
                        //                            TextField("Timezone", text: $contact.timezone).font(.body)
                        //                        }
                    }
                    Spacer()
                }
                .blur(radius: self.contactDatastore.isLoading ? 3 : 0)
                
                if self.contactDatastore.isLoading {
                    ContactLoadingView()
                }
            }
            .navigationBarTitle(Text("Add Contact"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {self.showAddSheet = false}, label: {Text("Done")}))
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    Button("Reset") {
                        self.contact = Contact()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Submit") {
                        self.contactDatastore.addContact(contact: self.contact)
                        self.showAddSheet = false
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

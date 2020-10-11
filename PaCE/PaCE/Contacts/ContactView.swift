//
//  ContactView.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var contactDatastore: ContactStore
    @State var showAddSheet = false
    @State var showDeletedContacts = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    List {
                        ForEach(self.contactDatastore.contacts.indexed(), id: \.1.id) { index, _ in                                 ContactViewItem(contact: self.$contactDatastore.contacts[index])
                        }.onDelete(perform: { indexSet in
                            removeContact(atOffset: indexSet, contactDatastore: self.contactDatastore)
                        })
                    }
                    
                }.blur(radius: self.contactDatastore.isLoading ? 3 : 0)
                if self.contactDatastore.isLoading {
                    ContactLoadingView()
                }
                Spacer()
            }
        }
        .navigationBarTitle("Contacts")
        .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        self.showAddSheet.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    }.sheet(isPresented: $showAddSheet) {
                                        ContactAdd(showAddSheet: $showAddSheet).environmentObject(contactDatastore)
                                    }

                                    Button(action: {
                                        self.contactDatastore.getAllContacts()
                                    }) {
                                        Image(systemName: "arrow.clockwise")
                                    }
                                })
    }
}

func removeContact(atOffset: IndexSet, contactDatastore: ContactStore) {
    let tempContacts = contactDatastore.contacts
    atOffset.forEach { (i) in
        contactDatastore.deleteContact(contact: tempContacts[i])
    }
}

struct ContactViewItem: View {
    @EnvironmentObject var contactDatastore: ContactStore
    let contact: Binding<Contact>
    
    var body: some View {
        if contact.deleted.wrappedValue == false {
            NavigationLink(destination: ContactDetail(contact: contact)) {
                HStack{
                    ContactView.Icon(contact: contact)
                    VStack(alignment: .leading) {
                        ContactView.FullName(contact: contact)
                        ContactView.Company(contact: contact).font(.subheadline)
                        Text(String(contact.deleted.wrappedValue))
                    }
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

extension ContactView {
    struct Icon: View {
        @Binding var contact: Contact
        var body: some View {
            NormalIcon(left: contact.firstName, right: contact.lastName)
        }
    }
    struct FullName: View {
        @Binding var  contact: Contact
        var body: some View {
            HStack {
                Text(contact.firstName + " " + contact.lastName)
                    .font(.headline)
            }
        }
    }
    struct Company: View {
        @Binding var contact: Contact
        var body: some View {
            HStack {
                Text(contact.company)
            }
        }
    }
}

struct ContactLoadingView: View {
    @EnvironmentObject var contactDatastore: ContactStore
    var body: some View {
        LoadingScreen(isLoading: self.contactDatastore.isLoading)
    }
}

struct ContactView_Previews: PreviewProvider {
    static let store = ContactStore()
    
    static var previews: some View {
        ContactView().environmentObject(store)
    }
}

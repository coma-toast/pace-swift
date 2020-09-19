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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    List {
                        ForEach(self.contactDatastore.contacts.indexed(), id: \.1.id) { index, _ in
                            ContactViewItem(contact: self.$contactDatastore.contacts[index])
                        }
                    }
                    Spacer()
                }.blur(radius: self.contactDatastore.isLoading ? 3 : 0)
                if self.contactDatastore.isLoading {
                    LoadingView()
                }
            }.navigationBarTitle("Contacts")
        }
    }
}

struct ContactViewItem: View {
    let contact: Binding<Contact>
    
    var body: some View {
        NavigationLink(destination: ContactDetail(contact: contact)) {
            HStack{
                ContactView.Icon(contact: contact)
                VStack(alignment: .leading) {
                    ContactView.FullName(contact: contact)
                    ContactView.Company(contact: contact).font(.subheadline)
                }
                Spacer()
            }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
        }.buttonStyle(PlainButtonStyle())
    }
}

extension ContactView {
    struct Icon: View {
        @Binding var contact: Contact
        var body: some View {
            ZStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 3)
                
                VStack{
                    Text(contact.firstName.prefix(1) + contact.lastName.prefix(1))
                        .font(.largeTitle)
                        .fixedSize(horizontal: false, vertical: false)
                    
                }
            }
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

struct LoadingView: View {
    @EnvironmentObject var contactDatastore: ContactStore
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Loading...").disabled(self.contactDatastore.isLoading)
            }.frame(width: geometry.size.width / 2,
                    height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.contactDatastore.isLoading ? 1 : 0)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static let store = ContactStore()
    
    static var previews: some View {
        ContactView().environmentObject(store)
    }
}

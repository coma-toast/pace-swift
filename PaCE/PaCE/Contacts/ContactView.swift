//
//  ContactView.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    @ObservedObject var viewModel = ContactViewModel()
    init() {
        viewModel.getAllContacts()
    }
    
    var body: some View {
        ForEach(viewModel.contacts, id: \.id) { contact in
            NavigationLink(destination: ContactDetail(contact: contact)) {
                HStack{
                    Icon(contact: contact)
                    VStack(alignment: .leading) {
                        FullName(contact: contact)
                        Text(contact.company).font(.subheadline)
                    }
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

//struct TestContactView: View {
//    static var viewModel:[Contact] = [
//        Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1"),
//        Contact(id: "1", created: "123", firstName: "Joe", lastName: "Schmoe", company: "Company ABC", email: "jschmoe@123", phone: "1234", timezone: "edt", instance: "1"),
//    ]
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            ForEach(TestContactView.viewModel, id: \.id) { contact in
//                HStack{
//                    Icon(contact: contact)
//                    VStack(alignment: .leading) {
//                        FullName(contact: contact)
//                        Text(contact.company).font(.subheadline)
//                    }
//                    Spacer()
//                }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
//            }
//        }
//    }
//}


extension ContactView {
    struct Icon: View {
        let contact: Contact
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
        let contact: Contact
        var body: some View {
            HStack {
                Text(contact.firstName + " " + contact.lastName)
                    .font(.headline)
            }
        }
    }
}

//struct ContactView_Previews: PreviewProvider {
////    static var viewModel = ContactViewModel()
//    static var viewModel: [Contact] = [
//        Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1"),
//        Contact(id: "1", created: "123", firstName: "Joe", lastName: "Schmoe", company: "Company ABC", email: "jschmoe@123", phone: "1234", timezone: "edt", instance: "1"),
//    ]
//    
//    
//    static var previews: some View {
//        ContactView(viewModel:viewModel)
//    }
//}

//
//  ContactDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/22/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    let contact: Contact
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
            VStack{
                ContactView.Icon(contact: contact)
                Divider()
                VStack(alignment: .leading) {
                    HStack{
                        Text("Name: ").bold()
                    
                    ContactView.FullName(contact: contact)
                    }
                    Text(contact.company).font(.subheadline)
                    Text(contact.email)
                    Text(contact.phone)
                    Text(contact.timezone)
                
                }
            }
        }
    }
}

struct ContactDetail_Previews: PreviewProvider {
//    let contacts = ContactViewModel()
    static var contact = Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")

    static var previews: some View {
        ContactDetail(contact: contact)
    }
}

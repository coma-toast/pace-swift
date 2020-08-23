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
        VStack{
            ContactView.Icon(contact: contact)
            Divider()
            VStack(alignment: .leading) {
                ContactView.FullName(contact: contact)
                Text(contact.company).font(.subheadline)
                Text(contact.email)
                Text(contact.phone)
                Text(contact.timezone)
            }
        }
    }
}

struct ContactDetail_Previews: PreviewProvider {
    let contact = Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
    static var previews: some View {
        ContactDetail(contact: contact)
    }
}

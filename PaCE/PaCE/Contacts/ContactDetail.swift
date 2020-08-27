//
//  ContactDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/22/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    var contact: Contact
    //    var body: some View {
    //        ZStack{
    //            RoundedRectangle(cornerRadius: 25, style: .continuous)
    //                .fill(Color.red)
    //            VStack{
    //                ContactView.Icon(contact: contact)
    //                Divider()
    //                VStack(alignment: .leading) {
    //                    // Grid items
    //                    HStack{
    //                        Text("Name: ").bold()
    //
    //                    ContactView.FullName(contact: contact)
    //                    }
    //                    HStack {
    //                        Text("Company: ").bold()
    //                    Text(contact.company).font(.subheadline)
    //                    }
    //                    Text(contact.email)
    //                    Text(contact.phone)
    //                    Text(contact.timezone)
    //
    //                }
    //            }
    //        }
    //    }
    var body: some View {
        VStack {
            Spacer()
            ContactView.Icon(contact: contact)                       .shadow(radius: 10)
            
            HStack {
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.largeTitle)
                
//
//                Button(action: { contact.isFavorite.toggle() }) {
//                    if contact.isFavorite {
//                        Image(systemName: "star.fill")
//                            .font(.headline)
//                            .foregroundColor(.yellow)
//                    } else {
//                        Image(systemName: "star")
//                            .font(.headline)
//                            .foregroundColor(.gray)
//                    }
//                }
            }
            Divider()
            
            HStack {
                Text("Phone").frame(width: 100, alignment: .trailing).font(Font.body.bold())
                Text(contact.phone)
                Spacer()
            }.padding(.bottom, 5).padding(.leading, 100)
            
            HStack {
                Text("Email").frame(width: 100, alignment: .trailing).font(Font.body.bold())
                Text(contact.email).multilineTextAlignment(.leading)
                Spacer()
            }.padding(.bottom, 5).padding(.leading, 100)
            
            HStack {
                Text("Company").frame(width: 100, alignment: .trailing).font(Font.body.bold())
                Text(contact.company)
                Spacer()
            }.padding(.bottom, 5).padding(.leading, 100)
            
            Spacer()
        }.padding(40)
    }
    
}

struct ContactDetail_Previews: PreviewProvider {
    //    let contacts = ContactViewModel()
    static var contact = Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
    
    static var previews: some View {
        ContactDetail(contact: contact)
    }
}
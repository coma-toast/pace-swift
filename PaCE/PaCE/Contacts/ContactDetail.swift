//
//  ContactDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/22/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ContactDetail: View {
    @Binding var contact: Contact
    var labels = [
        "id",
        "created",
        "firstname",
        "lastname",
        "company",
        "email",
        "phone",
        "timezone",
        "isfavorite",
        "instance",
    ]
    var arrayData: [String] = []
    init(contact: Contact) {
        let contact = contact
        self.arrayData = []
        self.labels = []
        self.arrayData = reflectProperties(data: contact)
    }
    
    
    var body: some View {
        
        //        let arrayData: [String]
        //        Mirror.reflectProperties(of: contact, using: arrayData:(T)-> Void)
        VStack {
            Text("test")
            DetailView(labels: labels, data: arrayData)
        }
    }
    func reflectProperties(data: Contact) -> [String] {
        let mirror = Mirror(reflecting: data)
        let returnArray: [String]
        mirror.map
        
//        for child in mirror.children {
//            returnArray.append(child.value as! String)
//
//        }
    }
}

//            DetailView
//            Spacer()
//            ContactView.Icon(contact: contact)                       .shadow(radius: 10)
//
//            HStack {
//                Text("\(contact.firstName) \(contact.lastName)")
//                    .font(.largeTitle)
//
////
////                Button(action: { contact.isFavorite.toggle() }) {
////                    if contact.isFavorite {
////                        Image(systemName: "star.fill")
////                            .font(.headline)
////                            .foregroundColor(.yellow)
////                    } else {
////                        Image(systemName: "star")
////                            .font(.headline)
////                            .foregroundColor(.gray)
////                    }
////                }
//            }
//            Divider()
//
//            HStack {
//                Text("Phone").frame(width: 100, alignment: .trailing).font(Font.body.bold())
//                Text(contact.phone)
//                Spacer()
//            }.padding(.bottom, 5).padding(.leading, 100)
//
//            HStack {
//                Text("Email").frame(width: 100, alignment: .trailing).font(Font.body.bold())
//                Text(contact.email).multilineTextAlignment(.leading)
//                Spacer()
//            }.padding(.bottom, 5).padding(.leading, 100)
//
//            HStack {
//                Text("Company").frame(width: 100, alignment: .trailing).font(Font.body.bold())
//                Text(contact.company)
//                Spacer()
//            }.padding(.bottom, 5).padding(.leading, 100)
//
//            Spacer()
//        }.padding(40)








//
//extension Mirror {
//    static func reflectProperties<T>(
//        of target: Any,
//        matchingType type: T.Type = T.self,
//        using closure: (T) -> Void
//    ) {
//        let mirror = Mirror(reflecting: target)
//
//        for child in mirror.children {
//            (child.value as? T).map(closure)
//        }
//    }
//}

// TODO: automatically generate label array
//func objectToArray(data: ) -> [String] {
//    var returnArray: [String] = []
//    ForEach(0 ... data.count) {
//        returnArray.append($0)
//    }
//    return returnArray
//}

struct ContactDetail_Previews: PreviewProvider {
    //    let contacts = ContactViewModel()
    static var contact = Contact(id: "1234", created: "123", firstName: "Testy", lastName: "McContact", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
    
    static var previews: some View {
        ContactDetail(contact: contact)
    }
}


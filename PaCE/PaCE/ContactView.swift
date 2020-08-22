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
    
    var body: some View {
        ForEach(viewModel.contacts, id: \.id) { contact in
//            List(viewModel.contacts) { _ in
                HStack {
                    VStack(alignment: .leading) {
                        HStack{
                            Text(contact.firstName)
                                .font(.headline)
                            Text(contact.lastName)
                                .font(.headline)
                            }
                        Text(contact.company)
                            .font(.subheadline)
                    }
                }.padding().border(Color.gray, width: 1).frame(maxWidth: .infinity).shadow(radius: 0.5)
            }
//        }
    }
}
func loadData() {
    
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}

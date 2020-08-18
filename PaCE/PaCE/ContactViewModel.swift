//
//  ContactViewModel.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import Combine

class ContactViewModel: ObservableObject {

    @Published var contacts: [Contact]
    var cancellationToken: AnyCancellable?
    
    init() {
        
        self.contacts = [Contact()]
        getContacts()
    }
    
    func getContacts() {
        cancellationToken = DB.request(.allContacts)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  
                  receiveValue: {
                    print($0)
                    self.contacts = $0.contacts
            }
        )
    }
}


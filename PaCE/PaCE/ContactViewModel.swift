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

    @Published var contacts: [Contact] = []
    var cancellationToken: AnyCancellable?
    
    init() {
//        self.contacts =
        // Thread
//        DispatchQueue.global(qos: .userInteractive).async {
//
////        self.contacts = try [Contact(from: <#Decoder#>)]
        getContacts()
//            DispatchQueue.main.async {
////                Reload data
//            }
//        }
    }
    
    func getContacts() {
        API().call(endpoint: "https://pace-api.jasondale.me/api/contact", completion: {data  in
            do {
                self.contacts = try JSONDecoder().decode([Contact].self, from: data!)
                
            }
            catch {
                print("Error getting contacts: \(error)")
            }
        })
        
//        cancellationToken = DB.request(.allContacts)
//            .mapError({ (error) -> Error in
//                print(error)
//                return error
//            })
//            .sink(receiveCompletion: { _ in },
//
//                  receiveValue: {
//                    print($0)
//                    self.contacts = $0.contacts
//            }
//        )
//    }
    }
}

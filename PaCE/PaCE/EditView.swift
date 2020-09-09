//
//  EditView.swift
//  PaCE
//
//  Created by Jason Dale on 9/8/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct EditView: View {
    @State var labels: [String]
    @State var data: [String]
    var body: some View {
        NavigationView {
            Form {
                ForEach(labels.indices, id: \.self) {i in
                    HStack{
                        Text(String.titleCase(self.labels[i])()).frame(width: 100, alignment: .trailing).font(Font.body.bold())
                        TextField(self.labels[i], text: self.$data[i])
                    }
                }
                
            }.navigationBarTitle("Edit Contact")
            Spacer()
            
        }
        
    }
}

struct EditView_Previews: PreviewProvider {
    static var labels = ["name", "phone"]
    static var data = ["John smith", "1234567890"]
    static var previews: some View {
        EditView(labels: labels, data: data)
    }
}

//
//  DetailView.swift
//  PaCE
//
//  Created by Jason Dale on 8/26/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var labels: [String]
    @Binding var data: [String]
    
    var body: some View {
        VStack{
            ForEach(self.labels.indices, id: \.self) {i in
                HStack {
                    Text(self.labels[i]).frame(width: 100, alignment: .trailing).font(Font.body.bold())
                    Text(self.data[i])
                    Spacer()
                }.padding(.bottom, 5)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State(initialValue:  ["name", "phone"]) var labels: [String]
        @State(initialValue: ["myself smith", "1234567890"]) var data: [String]
        var body: some View {
            DetailView(labels: $labels, data: $data)
        }
    }
}




//
//  ExtendedDetailView.swift
//  PaCE
//
//  Created by Jason Dale on 10/12/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ExtendedDetailView: View {
    var labels: [String]
    var data: [String]

    var body: some View {
        VStack {
            ForEach(self.labels.indices, id: \.self) {i in

                VStack(alignment: .leading, spacing: 0){
                    HStack {
                        Text(self.labels[i]).font(Font.body.bold())
                        Spacer()
                    }.padding(.bottom, 2)
                    HStack {
                        Text(self.data[i]).padding(.leading, 10)
                        Spacer()
                    }
                }
                .padding(.bottom, 5)
                .padding(.leading, 10)

            }
            Spacer()
        }
    }
}


struct ExtendedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State(initialValue:  ["General Contractor", "Inspection Lab", "some label"]) var labels: [String]
        @State(initialValue: ["General Patton", "Inspection Lab of City Long Name, California", "some data"]) var data: [String]
        var body: some View {
            ExtendedDetailView(labels: labels, data: data)
        }
    }
}

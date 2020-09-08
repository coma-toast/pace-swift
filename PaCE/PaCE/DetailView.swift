//
//  DetailView.swift
//  PaCE
//
//  Created by Jason Dale on 8/26/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let labels: [String]
    let data: [String]
    var body: some View {
        VStack{
            ForEach(labels.indices, id: \.self) {i in
            HStack {
                Text(String.titleCase(self.labels[i])).frame(width: 100, alignment: .trailing).font(Font.body.bold())
                Text(self.data[i])
                Spacer()
            }.padding(.bottom, 5)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var labels = ["name", "phone"]
    static var data = ["myself smith", "1234567890"]
    static var previews: some View {
        DetailView(labels: labels, data: data)
    }
}

extension String {
    func titleCase() -> String {
        return self
            .replacingOccurrences(of: "([A-Z])",
                                  with: " $1",
                                  options: .regularExpression,
                                  range: range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
}


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
                Text(self.labels[i]).frame(width: 100, alignment: .trailing).font(Font.body.bold())
                Text(self.data[i])
                Spacer()
            }.padding(.bottom, 5).padding(.leading, 100)
            }
        }
    }
}

//func parseObject(object: <Any>) -> [String] {
//    var returnArray: [String] = []
//    ForEach(object, id: \.self) { item in
//        returnArray.append(item)
//    
//}

struct DetailView_Previews: PreviewProvider {
    static var labels = ["name", "phone"]
    static var data = ["myself smith", "1234567890"]
    static var previews: some View {
        DetailView(labels: labels, data: data)
    }
}

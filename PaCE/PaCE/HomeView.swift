//
//  HomeView.swift
//  PaCE
//
//  Created by Jason Dale on 8/13/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: ContactView()) {
                        
                        Image("contact").resizable().frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("Contacts").font(.title)
                    }.padding().border(Color.gray, width: 1)
                    
                }
                HStack {
                    NavigationLink(destination: ProjectView()) {
                        Image("notepad").resizable().frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("Projects").font(.title)
                    }.padding().border(Color.gray, width: 1)
                }
                HStack {
                    Image("ruler").resizable().frame(width: 40, height: 40, alignment: .leading)
                    Spacer()
                    Text("Inspections").font(.title)
                }.padding().border(Color.gray, width: 1)
                HStack {
                    Image("steel").resizable().frame(width: 40, height: 40, alignment: .leading)
                    Spacer()
                    Text("Inventory").font(.title)
                }.padding().border(Color.gray, width: 1)
                HStack {
                    Image("gear").resizable().frame(width: 40, height: 40, alignment: .leading)
                    Spacer()
                    Text("Settings").font(.title)
                }.padding().border(Color.gray, width: 1)
            }.padding(0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewLayout(.fixed(width: 375, height: 500))
    }
}

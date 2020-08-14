//
//  ContentView.swift
//  PaCE
//
//  Created by Jason Dale on 8/12/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

// TODO: attribution in description
// <div>Icons made by <a href="https://www.flaticon.com/authors/icongeek26" title="Icongeek26">Icongeek26</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

import SwiftUI

// Idea: splash screen can have the old school film "3...2...1"
// https://www.pinterest.com/pin/744360644645379508/
struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                PaceImage()
                Text("Welcome to PaCE")
            }
            .font(.title)
            .padding()
            .frame(height: 75)
        
            HStack {
                HomeView()
            }
        }
    }
}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


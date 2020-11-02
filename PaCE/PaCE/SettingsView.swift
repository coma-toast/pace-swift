//
//  SettingsView.swift
//  PaCE
//
//  Created by Jason Dale on 11/1/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var darkMode = false
    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $darkMode)
            Spacer()
            NavigationLink("Styling Examples", destination: Styling())
            
        }
        .padding()
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

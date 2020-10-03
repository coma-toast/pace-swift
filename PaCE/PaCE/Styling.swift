//
//  Styling.swift
//  PaCE
//
//  Created by Jason Dale on 9/27/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct Styling: View {
    var body: some View {
        VStack {
            Text("Styling examples")
            Spacer()
            Button(action: {
                print("Neumorphic")
            }, label: {
                Text("Neumorphic")
            }).buttonStyle(NeumorphicButtonStyle(bgColor: Color.gray))
            
            Spacer()
            Text("toolbar?")
            
            
        }
        
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Spacer()
                    Button("Toolbar Button") {
                        print("toolbar")
                    }
                    Button(action: {}, label: {
                        Image(systemName: "trash")
                    })
                }
            }
        }
        )
    }
}
//
//ToolbarItem(placement: .bottomBar) {
//    HStack {
//        Button("Reset") {
//            self.contact = Contact()
//        }
//        .buttonStyle(NeumorphicButtonStyle(bgColor: Color.white))
//
//
//        Button("Submit") {
//            self.contactDatastore.addContact(contact: self.contact)
//            self.showAddSheet = false
//        }
//    }


struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}

struct NeumorphicToolbarButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}

struct Styling_Previews: PreviewProvider {
    static var previews: some View {
        Styling()
    }
}

//
//  Styling.swift
//  PaCE
//
//  Created by Jason Dale on 9/27/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct Styling: View {
//    @EnvironmentObject var contactDatastore: ContactStore
    var body: some View {
        ZStack{
            VStack {
                Text("Styling examples").font(.title)
                Text("Here's an icon example:")
                NormalIcon(left: "A", right: "4")
                Text("A ButtonStyle:")
                Button(action: {
                    print("Neumorphic")
                }, label: {
                    Text("Neumorphic")
                }).buttonStyle(NeumorphicButtonStyle(bgColor: Color.gray))
//                Text("Loading screen:")
//                Button(action: {
//                    self.contactDatastore.isLoading = true
//                    sleep(2)
//                    self.contactDatastore.isLoading = false
//                }, label: {
//                    Image(systemName: "timer")
//                }).buttonStyle(NeumorphicButtonStyle(bgColor: Color.gray))
                Spacer()
                Text("Toolbar:")
            }
//            .blur(radius: self.contactDatastore.isLoading ? 3 : 0)
//            Text("zstack")
//            if self.contactDatastore.isLoading {
//                VStack {
//                    Text("LOADING TRUE")
//                    LoadingScreen(isLoading: self.contactDatastore.isLoading)
//                }
//            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                Button("Toolbar Button") {}
            }
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {}, label: {
                    Image(systemName: "trash")
                })
            }
        })
    }
}

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


// TODO: I think you can't style toolbar buttons.
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

struct NormalIcon: View {
    let left: String
    let right: String
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .frame(width: 60, height: 60)
                .shadow(radius: 3)
            VStack{
                Text(left.prefix(1) + right.prefix(1))
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: false)
            }
        }
    }
}

struct SingleIcon: View {
    let iconString: String
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .frame(width: 60, height: 60)
                .shadow(radius: 3)
            VStack{
                Text(iconString.prefix(1))
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: false)
            }
        }
    }
}

// TODO: this still looks weird, revisit this soon.
struct LoadingScreen: View {
    var isLoading: Bool
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("Loading").disabled(isLoading)
            }.frame(width: geometry.size.width / 2,
                    height: geometry.size.height / 5)
            .background(Color.secondary.colorInvert())
            .foregroundColor(Color.primary)
            .cornerRadius(20)
            .opacity(isLoading ? 1 : 0)
        }.background(Color.red.opacity(0.5))
    }
}

struct Styling_Previews: PreviewProvider {
    static var previews: some View {
        Styling()
    }
}

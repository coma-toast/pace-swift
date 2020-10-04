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
            Text("Styling examples").font(.title)
            Spacer()
            Text("Here's an icon example:")
            NormalIcon(left: "A", right: "4")
            Spacer()
            Text("A ButtonStyle:")
            Button(action: {
                print("Neumorphic")
            }, label: {
                Text("Neumorphic")
            }).buttonStyle(NeumorphicButtonStyle(bgColor: Color.gray))
            Spacer()
            Text("Toolbar:")
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
    //    @Binding var left: String
    //    @Binding var right: String
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

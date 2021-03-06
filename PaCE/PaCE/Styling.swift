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
    @EnvironmentObject var companyDatastore: CompanyStore
    @State var date = Date()
    @State var company = Company()
    var body: some View {
        ScrollView {
            VStack{
                VStack {
                    HStack {
                        Text("Styling examples").font(.title)
                        Spacer()
                    }
                    HStack {
                        Text("Here are icon examples:")
                        Spacer()
                    }
                    NormalIcon(left: "A", right: "4")
                    SingleIcon(iconString: "Test")
                }
                VStack {
                    HStack {
                        Text("Button Styles:")
                        Spacer()
                    }
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
                }
                VStack {
                    HStack {
                        Text("Form Items:")
                        Spacer()
                    }
                    FormItemText(title: "Title", inputField: .constant("String"))
                    FormItemDate(title: "Date", inputField: $date)
                    FormItemNumber(title: "Quantity", inputField: .constant(3))
                    FormItemNumberString(title: "Zip Code", inputField: .constant("90210"))
                    FormCompanyPicker(title: "Company", selectedCompany: $company)
                    Spacer()
                }
                VStack {
                    Text("next vstack")
                }
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

/*
 # Navigation list
 */
struct NavButton<Destination: View>: View {
    let destination: Destination
    let image: String
    let text: String

    init(@ViewBuilder destination: @escaping () -> Destination, image: String, text: String) {
        self.destination = destination()
        self.image = image
        self.text = text
    }

    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .leading)
                .cornerRadius(10)
            Spacer()
            Text(text).font(.title).foregroundColor(.black)
        }
        .padding()
        .background(Color(red: 0.8, green: 0.8, blue: 0.8))
        .cornerRadius(15)
        .shadow(color: Color.black, radius: 5, x:3, y:3)
    }
}

/*
 # Icons
 */

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

/*
 # Form styling
 */

struct FormItemText: View {
    var title: String
    @Binding var inputField: String
    var body: some View {
        HStack {
            Text(title).bold()
            TextField(title, text: $inputField).font(.body)
        }
    }
}

struct FormItemNumber: View {
    var title: String
    @Binding var inputField: Int
    var body: some View {
        HStack {
            Text(title).bold()
            TextField(title, value: $inputField, formatter: NumberFormatter()).font(.body)
        }
    }
}

struct FormItemNumberString: View {
    var title: String
    @Binding var inputField: String
    var body: some View {
        HStack {
            Text(title).bold()
            TextField(title, text: $inputField).font(.body)
            // TODO: should it be an int? string of numbers doesn't seem to work?
            //            TextField(title, value: $inputField, formatter: NumberFormatter()).font(.body)
        }
    }
}

struct FormItemDate: View {
    var title: String
    @Binding var inputField: Date
    var body: some View {
        HStack {
            Text(title).bold()
            DatePicker("", selection: $inputField)
            Spacer()
        }
    }
}

struct FormFavorite: View {
    @Binding var favorite: Bool
    var body: some View {
        HStack {
            Text("Favorite").bold()
            Image(systemName: "star")
        }
    }
}

struct FormCompanyPicker: View {
    @EnvironmentObject var companyDatastore: CompanyStore
    var title: String
    @Binding var selectedCompany: Company
    var body: some View {
        Picker(selection: $selectedCompany, label: Text(title).bold(), content: {
            ForEach(companyDatastore.companies, id: \.id) { company in
                Text(company.name).tag(company)
            }
        })
    }
}

struct FormContactPicker: View {
    @EnvironmentObject var contactDatastore: ContactStore
    var title: String
    @Binding var selectedContact: Contact
    var body: some View {
        Form {
            Picker(selection: $selectedContact, label: Text(title).bold(), content: {
                ForEach(contactDatastore.contacts, id: \.id) { contact in
                    Text("\(contact.firstName) \(contact.lastName)").tag(contact)
                }
            })
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
        NavigationView {Styling()}
    }
}

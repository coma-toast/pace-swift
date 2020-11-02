//
//  HomeView.swift
//  PaCE
//
//  Created by Jason Dale on 8/13/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import SwiftUI
// TODO: state, archive state https://github.com/Dimillian/MovieSwiftUI/blob/master/MovieSwift/MovieSwift/views/components/home/HomeView.swift

// TODO: cached data locally - what do we do when API data is different from local cached data?

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                // TODO: this is not DRY
                //                NavButton(destination: () -> ContactView.Type, image: "contact", text: "Contacts")
                HStack {
                    NavigationLink(destination: ContactView()) {
                        Image("contact")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("Contacts").font(.title).foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 5, x:3, y:3)
                
                HStack {
                    NavigationLink(destination: ProjectView()) {
                        Image("notepad")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("Projects").font(.title).foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 5, x:3, y:3)

                HStack {
                    NavigationLink(destination: CompanyView()) {
                        Image("company")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("Companies").font(.title).foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 5, x:3, y:3)

                HStack {
                    Image("ruler").resizable().frame(width: 40, height: 40, alignment: .leading)
                    Spacer()
                    Text("Inspections").font(.title)
                }
                .padding()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 5, x:3, y:3)
                
                HStack {
                    Image("steel").resizable().frame(width: 40, height: 40, alignment: .leading)
                    Spacer()
                    Text("Inventory").font(.title)
                }
                .padding()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 5, x:3, y:3)
                HStack {
                    NavigationLink(
                        destination: Styling()) {
                        Image("gear").resizable().frame(width: 40, height: 40, alignment: .leading)
                        Spacer()
                        Text("Settings").font(.title).foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 5, x:3, y:3)
            }
            .navigationBarTitle("Menu")
            .padding(0)
        }.background(Color(red: 0.8, green: 0.8, blue: 0.8))

        
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

struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
    typealias Index = Base.Index
    typealias Element = (index: Index, element: Base.Element)
    
    let base: Base
    
    var startIndex: Index { base.startIndex }
    
    var endIndex: Index { base.endIndex }
    
    func index(after i: Index) -> Index {
        base.index(after: i)
    }
    
    func index(before i: Index) -> Index {
        base.index(before: i)
    }
    
    func index(_ i: Index, offsetBy distance: Int) -> Index {
        base.index(i, offsetBy: distance)
    }
    
    subscript(position: Index) -> Element {
        (index: position, element: base[position])
    }
}

extension RandomAccessCollection {
    func indexed() -> IndexedCollection<Self> {
        IndexedCollection(base: self)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



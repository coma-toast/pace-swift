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
        HomeView().previewLayout(.fixed(width: 375, height: 500))
    }
}

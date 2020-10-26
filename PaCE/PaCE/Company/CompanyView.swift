//
//  CompanyView.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct CompanyView: View {
    @EnvironmentObject var companyDatastore: CompanyStore
    @State var showAddSheet = false
    @State var showDeleted = false

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    List {
                        ForEach(self.companyDatastore.companies.indexed(), id: \.1.id) { index, _ in                                 CompanyViewItem(company: self.$companyDatastore.companies[index])
                        }.onDelete(perform: { indexSet in
                            removeCompany(atOffset: indexSet, companyDatastore: self.companyDatastore)
                        })
                    }

                }.blur(radius: self.companyDatastore.isLoading ? 3 : 0)
                if self.companyDatastore.isLoading {
                    CompanyLoadingView()
                }
                Spacer()
            }
        }
        .navigationBarTitle("Companies")
        .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        self.showAddSheet.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    }.sheet(isPresented: $showAddSheet) {
                                        CompanyAdd(showAddSheet: $showAddSheet).environmentObject(companyDatastore)
                                    }

                                    Button(action: {
                                        self.companyDatastore.getAllCompanies()
                                    }) {
                                        Image(systemName: "arrow.clockwise")
                                    }
                                })
    }
}

func removeCompany(atOffset: IndexSet, companyDatastore: CompanyStore) {
    let tempCompanies = companyDatastore.companies
    atOffset.forEach { (i) in
        companyDatastore.deleteCompany(company: tempCompanies[i])
    }
}

struct CompanyViewItem: View {
    @EnvironmentObject var companyDatastore: CompanyStore
    let company: Binding<Company>

    var body: some View {
        if company.deleted.wrappedValue == false {
            NavigationLink(destination: CompanyDetail(company: company)) {
                HStack{
                    CompanyView.Icon(company: company)
                    VStack(alignment: .leading) {
                        Text(company.name.wrappedValue)
                    }
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

extension CompanyView {
    struct Icon: View {
        @Binding var company: Company
        var body: some View {
            SingleIcon(iconString: company.name)
        }
    }
}

struct CompanyLoadingView: View {
    @EnvironmentObject var companyDatastore: CompanyStore
    var body: some View {
        LoadingScreen(isLoading: self.companyDatastore.isLoading)
    }
}

struct CompanyView_Previews: PreviewProvider {
    static let store = CompanyStore()

    static var previews: some View {
        CompanyView().environmentObject(store)
    }
}

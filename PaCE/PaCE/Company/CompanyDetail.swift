//
//  CompanyDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/22/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct CompanyDetail: View {
    let company: Binding<Company>
    var labels: [String] = []
    var data: [String] = []
    let hiddenFields: [String] = ["instance", "id", "favorite", "deleted", "created"]
    let dateFields: [String] = ["created"]
    @EnvironmentObject var companyDatastore: CompanyStore
    @State var showEditSheet = false
    init(company: Binding<Company>) {
        self.company = company
        reflectProperties(company: company.wrappedValue)
    }


    var body: some View {
        VStack {
            DetailView(labels: labels, data: data)
            //            NavigationLink(destination: CompanyEdit(company: company.wrappedValue)) {
            //                Text("Edit")
            //            }
            Spacer()

        }
        .navigationBarTitle(company.wrappedValue.name)
        .navigationBarItems(trailing: editCompanySheet(showEditSheet: self.$showEditSheet, company: company).environmentObject(companyDatastore))
    }
    mutating func reflectProperties(company: Company) {
        let mirror = Mirror(reflecting: company)

        for child in mirror.children {
            if let currentLabel = child.label {
                if !hiddenFields.contains(currentLabel) {
//                if (!hiddenFields.contains(currentLabel) || !dateFields.contains(currentLabel)) {
                    self.labels.append(String.titleCase(child.label ?? "")())
                    self.data.append(child.value as! String)
                }
            }
        }
    }
}

struct editCompanySheet: View {
    @Binding var showEditSheet: Bool
    @Binding var company: Company
    @EnvironmentObject var companyDatastore: CompanyStore
    var body: some View {
        HStack {
            Button(action: {
                self.showEditSheet.toggle()
            }) {
                Image(systemName: "pencil")
            }.sheet(isPresented: $showEditSheet) {
                NavigationView {
                    CompanyEdit(showEditSheet: $showEditSheet, company: company)
                        .environmentObject(companyDatastore)



                        .navigationBarItems(trailing: Button(action: {self.showEditSheet = false}, label: {Text("Done")}))
                        .navigationBarTitle("Edit")
                }
            }
        }
    }
}

struct CompanyDetail_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State(initialValue:  Company(id: "123", created: Date(), name: "Company, Co.", primaryContact: "123", phone: "1234567890", email: "fake@company.com", address: "123 fake st", city: "Beverly Hills", state: "CA", zip: "90210", favorite: true, deleted: false, instance: "123"))
        var company: Company

        var body: some View {
            CompanyDetail(company: $company)
        }
    }
}

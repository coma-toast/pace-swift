//
//  CompanyAdd.swift
//  PaCE
//
//  Created by Jason Dale on 9/8/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct CompanyAdd: View {
    @Binding var showAddSheet: Bool
    @State var company: Company = Company()
    @EnvironmentObject var companyDatastore: CompanyStore

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    // TODO: EditView(labels: labels, data: data)
                    // TODO: Form validation (not empty fields)
                    Form {
                        FormItemText(title: "Name", inputField: $company.name)
                        FormItemText(title: "PrimaryContact", inputField: $company.primaryContact)
                        FormItemText(title: "Phone", inputField: $company.phone)
                        FormItemText(title: "Email", inputField: $company.email)
                        FormItemText(title: "Address", inputField: $company.address)
                        FormItemText(title: "City", inputField: $company.city)
                        FormItemText(title: "State", inputField: $company.state)
                        FormItemNumber(title: "Zip", inputField: $company.zip)

                    }
                    Spacer()
                }
                .blur(radius: self.companyDatastore.isLoading ? 3 : 0)

                if self.companyDatastore.isLoading {
                    CompanyLoadingView()
                }
            }
            .navigationBarTitle(Text("Add Company"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {self.showAddSheet = false}, label: {Text("Done")}))
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    Button("Reset") {
                        self.company = Company()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Submit") {
                        self.companyDatastore.addCompany(company: self.company)
                        self.showAddSheet = false
                    }
                }
            })
        }
    }
}

//struct CompanyAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        CompanyAdd(Binding)
//    }
//}

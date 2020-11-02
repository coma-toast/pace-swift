//
//  CompanyEdit.swift
//  PaCE
//
//  Created by Jason Dale on 9/8/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct CompanyEdit: View {
    @Binding var showEditSheet: Bool
    @State var company: Company
    @EnvironmentObject var companyDatastore: CompanyStore

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                // TODO: EditView(labels: labels, data: data)
                Form {
                    FormItemText(title: "ID", inputField: $company.id)
                    FormItemText(title: "Name", inputField: $company.name)
                    FormItemText(title: "PrimaryContact", inputField: $company.primaryContact)
                    FormItemText(title: "Phone", inputField: $company.phone)
                    FormItemText(title: "Email", inputField: $company.email)
                    FormItemText(title: "Address", inputField: $company.address)
                    FormItemText(title: "City", inputField: $company.city)
                    FormItemText(title: "State", inputField: $company.state)
                    FormItemNumberString(title: "Zip", inputField: $company.zip)
                }
                Spacer()
            }
            .blur(radius: self.companyDatastore.isLoading ? 3 : 0)
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.companyDatastore.updateCompany(company: company)
                            self.showEditSheet = false
                        }, label: {
                            Image(systemName: "checkmark")
                        })
                        Spacer()
                    }
                }
            })
            if self.companyDatastore.isLoading {
                CompanyLoadingView()
            }
        }
    }
}

//struct CompanyEdit_Previews: PreviewProvider {
//    static var company: Binding<Company> = Binding<Company>(id: "1234", created: "june 1st 2020", firstName: "Testy", lastName: "McCompany", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
//    static var previews: some View {
//        CompanyEdit(company: company)
//    }
//}

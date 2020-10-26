//
//  Company.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class CompanyStore: ObservableObject {
    @Published var companies: [Company] = []
    @Published var isLoading:Bool = false
    init() {
        getAllCompanies()
    }

    func getAllCompanies(){
        DispatchQueue.main.async {
            self.isLoading = true
            let payloadData: [Company] = [Company]()

            API().call(endpoint: "company", method: "GET", payload: payloadData) { result in
                switch result {
                case .success(let companies):
                    // dev code
                    print(companies)
                    self.companies = companies
                    self.isLoading = false
                case .failure(let error):
                    // dev code
                    print(error)
                    self.isLoading = false
                }
            }
        }
    }

    // TODO: I am here. start building out Company, then make this function, then finish ProjectAdd so I can link a company
    func getCompaniesByCompany(company: Company) {
        // TODO: this
    }

    func updateCompany(company: Company) {
        isLoading = true
        API().call(endpoint: "company", method: "POST", payload: company) { result in
            switch result {
            case .success(let updatedCompany):
                if let row = self.companies.firstIndex(where: {$0.id == updatedCompany.id}) {
                    self.companies[row] = updatedCompany
                }
                // dev code
                print("Company \(updatedCompany.name) updated.")
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func addCompany(company: Company) {
        isLoading = true
        API().call(endpoint: "company", method: "PUT", payload: company) { result in
            switch result {
            case .success(let updatedCompany):
                self.getAllCompanies()
                if self.companies.firstIndex(where: {$0.id == updatedCompany.id}) != nil {

                    // dev code
                    print("Company \(updatedCompany.name) added.")
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func deleteCompanyPermanently(company: Company) {
        isLoading = true
        API().call(endpoint: "company", method: "DELETE", payload: company) { result in
            switch result {
            case .success(let status):
                self.getAllCompanies()
                if self.companies.firstIndex(where: {$0.id == company.id}) == nil {
                    // dev code
                    print("Result: \(status). Company \(company.name) deleted.")
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func deleteCompany(company: Company) {
        isLoading = true
        var companyToDelete = company
        companyToDelete.deleted = true
        API().call(endpoint: "company", method: "POST", payload: companyToDelete) { result in
            switch result {
            case .success(let deletedCompany):
                self.getAllCompanies()
                if deletedCompany.deleted == true {
                    // dev code
                    print("Company \(company.name) deleted.")
                }
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
}

struct Company: Codable, Identifiable {
    var id: String = ""
    var created: Date = Date()
    var name: String = ""
    var primaryContact: String = ""
    var phone: String = ""
    var email: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var zip: Int = 0
    var favorite: Bool = false
    var deleted: Bool = false
    var instance: String = ""

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case primaryContact = "primaryContact"
        case phone = "phone"
        case email = "email"
        case address = "address"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case favorite = "favorite"
        case deleted = "deleted"
        case instance = "instance"
    }
}

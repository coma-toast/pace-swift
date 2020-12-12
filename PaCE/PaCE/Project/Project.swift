//
//  Project.swift
//  PaCE
//
//  Created by Jason Dale on 8/23/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ProjectStore: ObservableObject {
    @Published var projects: [Project] = []
    @Published var isLoading:Bool = false
    @EnvironmentObject var companyDatastore: CompanyStore
    init() {
        getAllProjects()
    }
    
    func getAllProjects(){
        isLoading = true
        let payloadData: [Project] = [Project]()
        
        API().call(endpoint: "project", method: "GET", payload: payloadData) { result in
            switch result {
            case .success(let projects):
                self.projects = projects
                self.isLoading = false
            case .failure(let error):
                // dev code
                print(error)
                self.isLoading = false
            }
        }

        // Get the full Company for the client
        for i in self.projects.indices {
            self.projects[i].client = companyDatastore.getCompanyById(id: self.projects[i].id)
        }
    }
    
    func updateProject(project: Project) {
        isLoading = true
        API().call(endpoint: "project", method: "POST", payload: project) { result in
            switch result {
            case .success(let updatedProject):
                if let row = self.projects.firstIndex(where: {$0.id == updatedProject.id}) {
                    self.projects[row] = updatedProject
                }
                // dev code
                print("Project \(updatedProject.id) updated.")
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func addProject(project: Project) {
        isLoading = true
        API().call(endpoint: "project", method: "PUT", payload: project) { result in
            switch result {
            case .success(let updatedProject):
                self.getAllProjects()
                if self.projects.firstIndex(where: {$0.id == updatedProject.id}) != nil {

                    // dev code
                    print("Project \(updatedProject.name) added.")
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func deleteProjectPermanently(project: Project) {
        isLoading = true
        API().call(endpoint: "project", method: "DELETE", payload: project) { result in
            switch result {
            case .success(let status):
                self.getAllProjects()
                if self.projects.firstIndex(where: {$0.id == project.id}) == nil {
                    // dev code
                    print("Result: \(status). Project \(project.name) deleted.")
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }

    func deleteProject(project: Project) {
        isLoading = true
        var projectToDelete = project
        projectToDelete.deleted = true
        API().call(endpoint: "project", method: "POST", payload: projectToDelete) { result in
            switch result {
            case .success(let deletedProject):
                self.getAllProjects()
                if deletedProject.deleted == true {
                    // dev code
                    print("Project \(project.name) deleted.")
                }
                self.isLoading = false
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
}

struct Project: Codable, Identifiable, Hashable {
    var id: String = ""
    var created: Date = Date()
    var deleted: Bool = false
    var name: String = ""
    var startDate: Date = Date()
    var dueDate: Date = Date()
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var zip: Int = 0
    var projectManager: String = ""
    var projectManagerContact: Contact = Contact()
    var clientID: String = ""
    var client: Company = Company()
    var eORName: String = ""
    var detailerName: String = ""
    var inspectionLab: String = ""
    var steelErectorName: String = ""
    var steelFabricatorName: String = ""
    var generalContractor: String = ""
    var primaryContactName: String = ""
    var primaryContactPhone: String = ""
    var primaryContactEmail: String = ""
    var squareFootage: Int = 0
    var weightInTons: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case created = "created"
        case deleted = "deleted"
        case name = "name"
        case startDate = "startDate"
        case dueDate = "dueDate"
        case address = "address"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case projectManager = "projectManager"
        case clientID = "clientID"
        case eORName = "eORName"
        case detailerName = "detailerName"
        case inspectionLab = "inspectionLab"
        case steelErectorName = "steelErectorName"
        case steelFabricatorName = "steelFabricatorName"
        case generalContractor = "generalContractor"
        case primaryContactName = "primaryContactName"
        case primaryContactPhone = "primaryContactPhone"
        case primaryContactEmail = "primaryContactEmail"
        case squareFootage = "squareFootage"
        case weightInTons = "weightInTons"
    }
}


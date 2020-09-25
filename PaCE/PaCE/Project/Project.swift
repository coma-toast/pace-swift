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
    init() {
        getAllProjects()
    }
    
    func getAllProjects(){
        isLoading = true
        let payloadData: [Project] = [Project]()
        
        API().call(endpoint: "project", method: "GET", payload: payloadData) { result in
            switch result {
            case .success(let projects):
                // dev code
                print(projects)
                self.projects = projects
                self.isLoading = false
            case .failure(let error):
                // dev code
                print(error)
                self.isLoading = false
            }
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
}

struct Project: Codable, Identifiable {
    var id: String = ""
    var created: String = ""
    var name: String = ""
    var startDate: String = ""
    var dueDate: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var zip: Int = 0
    var projectManager: String = ""
    var clientName: String = ""
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
        case name = "name"
        case startDate = "startDate"
        case dueDate = "dueDate"
        case address = "address"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case projectManager = "projectManager"
        case clientName = "clientName"
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


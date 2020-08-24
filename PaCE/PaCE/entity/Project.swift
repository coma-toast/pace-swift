//
//  Project.swift
//  PaCE
//
//  Created by Jason Dale on 8/23/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation

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


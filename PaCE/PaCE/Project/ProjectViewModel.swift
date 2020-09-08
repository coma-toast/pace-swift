//
//  ProjectViewModel.swift
//  PaCE
//
//  Created by Jason Dale on 8/23/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import Foundation
import Combine

class ProjectViewModel: ObservableObject {
    @Published private(set) var projects = [Project]()
    
    func getAllProjects() {
        let payloadData = [Project]()
        API().call(endpoint: "project", method: "GET", payload: payloadData)  { result in
            switch result {
            case .success(let projects):
                print(projects)
                self.projects = projects
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

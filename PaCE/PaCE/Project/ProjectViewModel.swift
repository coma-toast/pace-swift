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
    @Published var projects: [Project] = []
    
    init() {
        getProjects()
    }
    
    func getProjects() {
        API().call(endpoint: "https://pace-api.jasondale.me/api/project", completion: {data  in
            do {
                self.projects = try JSONDecoder().decode([Project].self, from: data!)
                
            }
            catch {
                print("Error getting projects: \(error)")
            }
        })
    }
}

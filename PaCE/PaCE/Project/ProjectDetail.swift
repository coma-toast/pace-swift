//
//  ProjectDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/23/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ProjectDetail: View {
    let project: Binding<Project>
    var labels: [String] = []
    var data: [String] = []
    init(project: Binding<Project>) {
        self.project = project
//        self.labels = labels
//        self.data = data
        reflectProperties(project: project.wrappedValue)
    }
    
    
    var body: some View {
        VStack {
            DetailView(labels: labels, data: data)
            NavigationLink(destination: ProjectEdit(project: project.wrappedValue)) {
                Text("Edit")
            }
            Spacer()
        }.navigationBarTitle(project.wrappedValue.name)
    }
    mutating func reflectProperties(project: Project) {
        let mirror = Mirror(reflecting: project)
        
        for child in mirror.children {
            if child.label != Optional("instance"), child.label != Optional("id") {
                self.labels.append(String.titleCase(child.label ?? "")())
                self.data.append(child.value as! String)
            }
        }
    }
}

//struct ProjectDetail: View {
//    let project: Project
//    var body: some View {
//        VStack{
//            ProjectView.Icon(project: project)
//            Divider()
//            VStack(alignment: .leading) {
//                Text(project.clientName)
//                Text(project.startDate)
//                Text(project.dueDate)
//                ProjectView.Address(project: project)
//                Text(project.projectManager)
//                Text(project.eORName)
//                Text(project.detailerName)
//                Text(project.inspectionLab)
//                Text(project.steelErectorName)
////                Text(project.steelFabricatorName)
////                Text(project.generalContractor)
//                ProjectView.PrimaryProject(project: project)
////                Text(project.squareFootage)
////                Text(project.weightInTons)
//            }
//        }
//    }
//}

//struct ProjectDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetail()
//    }
//}

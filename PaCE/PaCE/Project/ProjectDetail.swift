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
    let hiddenFields: [String] = ["instance", "id", "favorite", "deleted"]
    let dateFields: [String] = ["created", "startDate", "dueDate"]
    let contactFields: [String] = ["projectManagerContact", "eORName", "detailerName", "inspectionLab", "steelErectorName", "steelFabricatorName", "generalContractor", "primaryContactName"]
    let companyFields: [String] = ["client"]
    @EnvironmentObject var projectDatastore: ProjectStore
    @State var showEditSheet = false
    init(project: Binding<Project>) {
        self.project = project
        reflectProperties(project: project.wrappedValue)
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                ExtendedDetailView(labels: labels, data: data)
                //            NavigationLink(destination: ProjectEdit(project: project.wrappedValue)) {
                //                Text("Edit")
                //            }
                Spacer()
            }
            .navigationBarTitle(project.wrappedValue.name)
            .navigationBarItems(trailing: editProjectSheet(showEditSheet: self.$showEditSheet, project: project).environmentObject(projectDatastore))
        }
    }
    mutating func reflectProperties(project: Project) {
        let mirror = Mirror(reflecting: project)
        
        for child in mirror.children {
            if let currentLabel = child.label {
                if !hiddenFields.contains(currentLabel), !dateFields.contains(currentLabel), !contactFields.contains(currentLabel), !companyFields.contains(currentLabel)  {
                    self.labels.append(String.titleCase(child.label ?? "")())
                    self.data.append((child.value as? String ?? String(child.value as! Int)))
                }
            }
        }
    }
}

struct editProjectSheet: View {
    @Binding var showEditSheet: Bool
    @Binding var project: Project
    @EnvironmentObject var projectDatastore: ProjectStore
    var body: some View {
        HStack {
            Button(action: {
                self.showEditSheet.toggle()
            }) {
                Image(systemName: "pencil")
            }.sheet(isPresented: $showEditSheet) {
                NavigationView {
                    ProjectEdit(showEditSheet: $showEditSheet, project: project)
                        .environmentObject(projectDatastore)



                        .navigationBarItems(trailing: Button(action: {self.showEditSheet = false}, label: {Text("Done")}))
                        .navigationBarTitle("Edit")
                }
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

//
//  ProjectAdd.swift
//  PaCE
//
//  Created by Jason Dale on 10/10/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ProjectAdd: View {
    @Binding var showAddSheet: Bool
    @State var project: Project = Project()
    @EnvironmentObject var projectDatastore: ProjectStore

    var body: some View {
        NavigationView {
            VStack {
                // TODO: Form validation (not empty fields)
                Form {
                    VStack {
                        FormItemText(title: "Name", inputField: $project.name)
                        FormItemText(title: "Address", inputField: $project.address)
                        FormItemText(title: "City", inputField: $project.city)
                        FormItemText(title: "State", inputField: $project.state)
                        FormItemNumber(title: "Zip Code", inputField: $project.zip)
                    }
                    VStack {
                        FormCompanyPicker(title: "Company", selectedCompany: $project.client)
                        FormContactPicker(title: "Project Manager", selectedContact: $project.projectManagerContact)
                    }
                    VStack {
                        FormContactPicker(title:"eORName", selectedContact: $project.eORName)
                        FormContactPicker(title:"Detailer Name", selectedContact: $project.detailerName)
                        FormContactPicker(title:"Inspection Lab", selectedContact: $project.inspectionLab)
                        FormContactPicker(title:"Steel Erector Name", selectedContact: $project.steelErectorName)
                        FormContactPicker(title:"Steel Fabricator Name", selectedContact: $project.steelFabricatorName)
                        FormContactPicker(title:"General Contractor", selectedContact: $project.generalContractor)
                        FormContactPicker(title:"Primary Contact Name", selectedContact: $project.primaryContactName)
                        FormItemText(title:"Primary Contact Phone", inputField: $project.primaryContactPhone)
                        FormItemText(title:"Primary Contact Email", inputField: $project.primaryContactEmail)
                    }
                    VStack {
                        FormItemNumber(title:"Square Footage", inputField: $project.squareFootage)
                        FormItemNumber(title:"Weight In Tons", inputField: $project.weightInTons)
                        FormItemDate(title: "Start Date" , inputField: $project.startDate)
                        FormItemDate(title: "Due Date", inputField: $project.dueDate)
                    }
                    Spacer()
                }
                .blur(radius: self.projectDatastore.isLoading ? 3 : 0)

                if self.projectDatastore.isLoading {
                    ProjectLoadingView()
                }
            }
            .navigationBarTitle(Text("Add Project"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {self.showAddSheet = false}, label: {Text("Done")}))

        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                Button("Reset") {
                    self.project = Project()
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
            ToolbarItem(placement: .bottomBar) {
                Button("Submit") {
                    self.projectDatastore.addProject(project: self.project)
                    self.showAddSheet = false
                }
            }
        })
        }
    }
}


//struct ProjectAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectAdd()
//    }
//}

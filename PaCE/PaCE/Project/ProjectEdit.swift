//
//  ProjectEdit.swift
//  PaCE
//
//  Created by Jason Dale on 9/8/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI
import Combine

struct ProjectEdit: View {
    @Binding var showEditSheet: Bool
    @State var project: Project
    @EnvironmentObject var projectDatastore: ProjectStore

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                // TODO: EditView(labels: labels, data: data)
                Form {
                    HStack {
                        Text("Name").bold()
                        TextField("Name", text: $project.name)
                    }
                    HStack {
                        Text("Start Date").bold()
                        DatePicker("Start Date", selection: $project.startDate)
                    }
                    HStack {
                        Text("Due Date").bold()
                        DatePicker("Due Date", selection: $project.dueDate)
                    }
                    Address(project: $project)
                    PrimaryContact(project: $project)
                    Names(project: $project)
                    Stats(project: $project)

                    Spacer()
                }
                .blur(radius: self.projectDatastore.isLoading ? 3 : 0)
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.projectDatastore.updateProject(project: self.project)
                                self.showEditSheet = false
                            }, label: {
                                Image(systemName: "checkmark")
                            })
                            Spacer()
                        }
                    }
                })
                if self.projectDatastore.isLoading {
                    ProjectLoadingView()
                }
            }
        }
    }
}
    struct Address: View {
        let project: Binding<Project>

        var body: some View {
            HStack {
                Text("Address").bold()
                TextField("Address", text: project.address)
            }
            HStack {
                Text("City").bold()
                TextField("City", text: project.city)
            }
            HStack {
                Text("State").bold()
                TextField("State", text: project.state)
            }
            HStack {
                Text("Zip").bold()
                TextField("Zip", value: project.zip, formatter: NumberFormatter())
            }
        }
    }

    struct Stats: View {
        let project: Binding<Project>

        var body: some View {
            HStack {
                Text("Square Footage").bold()
                TextField("Square Footage", value: project.squareFootage, formatter: NumberFormatter())
            }
            HStack {
                Text("Weight In Tons").bold()
                TextField("Weight In Tons", value: project.weightInTons, formatter: NumberFormatter())
            }
        }
    }

    struct PrimaryContact: View {
        let project: Binding<Project>

        var body: some View {
            HStack {
                Text("Primary Contact Name").bold()
                TextField("Primary Contact Name", text: project.primaryContactNameID)
            }
            HStack {
                Text("Primary Contact Phone").bold()
                TextField("Primary Contact Phone", text: project.primaryContactPhone)
            }
            HStack {
                Text("Primary Contact Email").bold()
                TextField("Primary Contact Email", text: project.primaryContactEmail)
            }
        }
    }

    struct Names: View {
        let project: Binding<Project>

        var body: some View {

            HStack {
                Text("Project Manager").bold()
                TextField("Project Manager", text: project.projectManager)
            }
            HStack {
                Text("Client Name").bold()
                TextField("Client Name", text: project.client.name)
            }
            HStack {
                Text("eOR Name").bold()
                TextField("eOR Name", text: project.eORNameID)
            }
            HStack {
                Text("Detailer Name").bold()
                TextField("Detailer Name", text: project.detailerNameID)
            }
            HStack {
                Text("Inspection Lab").bold()
                TextField("Inspection Lab", text: project.inspectionLabID)
            }
            HStack {
                Text("Steel Erector Name").bold()
                TextField("Steel Erector Name", text: project.steelErectorNameID)
            }
            HStack {
                Text("Steel Fabricator Name").bold()
                TextField("Steel Fabricator Name", text: project.steelFabricatorNameID)
            }
            HStack {
                Text("General Contractor").bold()
                TextField("General Contractor", text: project.generalContractorID)

            }
        }
    }

//struct ProjectEdit_Previews: PreviewProvider {
//    static var project: Binding<Project> = Binding<Project>(id: "1234", created: "june 1st 2020", firstName: "Testy", lastName: "McProject", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
//    static var previews: some View {
//        ProjectEdit(project: project)
//    }
//}

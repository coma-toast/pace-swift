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
                        TextField("Start Date", text: $project.startDate)
                    }
                    HStack {
                        Text("Due Date").bold()
                        TextField("Due Date", text: $project.dueDate)
                    }
                    Address(project: $project)
                }
                
                Form {
                    PrimaryContact(project: $project)
                    Names(project: $project)
                    Stats(project: $project)
                    
                    Button(action: {
                        self.projectDatastore.updateProject(project: self.project)
                    }) {
                        Text("Submit").bold().fontWeight(.heavy)
                    }
                }.background(Color.green)
                Spacer()
            }.background(Color.red)
            .blur(radius: self.projectDatastore.isLoading ? 3 : 0)
            if self.projectDatastore.isLoading {
                ProjectLoadingView()
            }
        }.navigationBarTitle("Edit")
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
            TextField("Primary Contact Name", text: project.primaryContactName)
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
            Text("ProjectManager").bold()
            TextField("ProjectManager", text: project.projectManager)
        }
        HStack {
            Text("ClientName").bold()
            TextField("ClientName", text: project.clientName)
        }
        HStack {
            Text("eORName").bold()
            TextField("eORName", text: project.eORName)
        }
        HStack {
            Text("Detailer Name").bold()
            TextField("Detailer Name", text: project.detailerName)
        }
        HStack {
            Text("Inspection Lab").bold()
            TextField("Inspection Lab", text: project.inspectionLab)
        }
        HStack {
            Text("Steel Erector Name").bold()
            TextField("Steel Erector Name", text: project.steelErectorName)
        }
        HStack {
            Text("Steel Fabricator Name").bold()
            TextField("Steel Fabricator Name", text: project.steelFabricatorName)
        }
        HStack {
            Text("General Contractor").bold()
            TextField("General Contractor", text: project.generalContractor)
            
        }
    }
}

//struct ProjectEdit_Previews: PreviewProvider {
//    static var project: Binding<Project> = Binding<Project>(id: "1234", created: "june 1st 2020", firstName: "Testy", lastName: "McProject", company: "Super Long Company Name, Co.", email: "test@superlongcompanynameco.com", phone: "1231231234", timezone: "EDT", instance: "1")
//    static var previews: some View {
//        ProjectEdit(project: project)
//    }
//}

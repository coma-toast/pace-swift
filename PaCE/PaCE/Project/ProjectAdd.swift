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
            ZStack(alignment: .top) {
                VStack {
                    // TODO: EditView(labels: labels, data: data)
                    // TODO: Form validation (not empty fields)
                    Form {
                        FormItem(title: "Name", inputField: $project.name)
                        HStack {
                            Text("Client").bold()
                            // TODO: client picker once getCompanies() works
                            TextField("Client", text: $project.clientName).font(.body)
                        }
                        HStack {
                            Text("Address").bold()
                            TextField("Address", text: $project.address).font(.body)
                        }
                        HStack {
                            Text("City").bold()
                            TextField("City", text: $project.city).font(.body)
                        }
                        HStack {
                            Text("State").bold()
                            TextField("State", text: $project.state).font(.body)
                        }
//                        HStack {
//                            Text("Zip Code").bold()
//                            TextField("Zip Code", text: $project.zip).font(.body)
//                        }
//                        HStack {
//                            Text("Project Manager").bold()
//                            TextField("Project Manager", text: $project.projectManager).font(.body)
//                        }HStack {
//                            Text("").bold()
//                            TextField("", text: $project.).font(.body)
//                        }
//                        HStack {
//                            Text("").bold()
//                            TextField("", text: $project.).font(.body)
//                        }
//                        HStack {
//                            Text("").bold()
//                            TextField("", text: $project.).font(.body)
//                        }
//                        HStack {
//                            Text("").bold()
//                            TextField("", text: $project.).font(.body)
//                        }
//                        HStack {
//                            Text("").bold()
//                            TextField("", text: $project.).font(.body)
//                        }
//                        HStack {
//                            Text("").bold()
//                            TextField("", text: $project.).font(.body)
//                        }                        }
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
struct FormItem: View {
    var title: String
    @Binding var inputField: String
    var body: some View {
        HStack {
            Text(title).bold()
            TextField(title, text: $inputField).font(.body)
        }
    }
}

//struct ProjectAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectAdd()
//    }
//}

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
                        FormItemText(title: "Name", inputField: $project.name)
                        FormItemText(title: "Client", inputField: $project.clientName)
                        FormItemText(title: "Address", inputField: $project.address)
                        FormItemText(title: "City", inputField: $project.city)
                        FormItemText(title: "State", inputField: $project.state)
                        FormItemNumber(title: "Zip Code", inputField: $project.zip)
                        FormItemContact(title: "Project Manager", inputField: $project.projectManager)

                        FormItemDate(title: "Start Date" , inputField: $project.startDate)


                        FormItemDate(title: "Due Date", inputField: $project.dueDate)


                        //                    FormItemDate(title: "", inputField: $project.)
                        //
                        //
                        //                    FormItem(title: "", inputField: $project.)
                        //
                        //
                        //                    FormItem(title: "", inputField: $project.)
                        //
                        //
                        //                    FormItem(title: "", inputField: $project.)



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
}



struct FormItemContact: View {
    var title: String
    // TODO: getContactsByCompany(company:
    var contact: Contact = Contact()
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

//
//  ProjectView.swift
//  PaCE
//
//  Created by Jason Dale on 8/14/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ProjectView: View {
    @EnvironmentObject var projectDatastore: ProjectStore
    @State var showAddSheet = false
    @State var showDeleted = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    List {
                        ForEach(self.projectDatastore.projects.indexed(), id: \.1.id) { index, _ in
                            ProjectViewItem(project: self.$projectDatastore.projects[index])
                        }.onDelete(perform: { indexSet in
                            removeProject(atOffset: indexSet, projectDatastore: self.projectDatastore)
                        })
                    }
                    
                }.blur(radius: self.projectDatastore.isLoading ? 3 : 0)
                if self.projectDatastore.isLoading {
                    ProjectLoadingView()
                }
                Spacer()
            }
            .navigationBarTitle("Projects")
            .navigationBarItems(trailing:
                                    HStack {
                                        Button(action: {
                                            self.showAddSheet.toggle()
                                        }) {
                                            Image(systemName: "plus")
                                        }.sheet(isPresented: $showAddSheet) {
                                            ProjectAdd(showAddSheet: $showAddSheet).environmentObject(projectDatastore)
                                        }

                                        Button(action: {
                                            self.projectDatastore.getAllProjects()
                                        }) {
                                            Image(systemName: "arrow.clockwise")
                                        }
                                    })
        }
    }
}

func removeProject(atOffset: IndexSet, projectDatastore: ProjectStore) {
    let tempProjects = projectDatastore.projects
    atOffset.forEach { (i) in
        projectDatastore.deleteProject(project: tempProjects[i])
    }
}

struct ProjectViewItem: View {
    @EnvironmentObject var projectDatastore: ProjectStore
    let project: Binding<Project>
    
    var body: some View {
        if project.deleted.wrappedValue == false {
            NavigationLink(destination: ProjectDetail(project: project)) {
                HStack{
                    ProjectView.Icon(project: project)
                    VStack(alignment: .leading) {
                        Text(project.name.wrappedValue)
                        Text(project.clientName.wrappedValue).font(.subheadline)
                    }
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

extension ProjectView {
    struct Icon: View {
        @Binding var project: Project
        var body: some View {
            SingleIcon(iconString: project.name)
        }
    }
}

struct ProjectLoadingView: View {
    @EnvironmentObject var projectDatastore: ProjectStore
    var body: some View {
        LoadingScreen(isLoading: self.projectDatastore.isLoading)
    }
}

struct ProjectView_Previews: PreviewProvider {
    static let store = ProjectStore()
    
    static var previews: some View {
        ProjectView().environmentObject(store)
    }
}

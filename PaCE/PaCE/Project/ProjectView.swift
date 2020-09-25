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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    List {
                        ForEach(self.projectDatastore.projects.indexed(), id: \.1.id) { index, _ in
                            ProjectViewItem(project: self.$projectDatastore.projects[index])
                        }
                    }
                    
                }.blur(radius: self.projectDatastore.isLoading ? 3 : 0)
                if self.projectDatastore.isLoading {
                    ProjectLoadingView()
                }
                Spacer()
            }.navigationBarTitle("Projects")
        }
    }
}

struct ProjectViewItem: View {
    @EnvironmentObject var projectDatastore: ProjectStore
    let project: Binding<Project>
    
    var body: some View {
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
            .navigationBarItems(trailing:
                Button("Refresh") {
                    self.projectDatastore.getAllProjects()
                }
        )
    }
}

extension ProjectView {
    struct Icon: View {
        @Binding var project: Project
        var body: some View {
            ZStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 3)
                
                VStack{
                    Text(project.name.prefix(1))
                        .font(.largeTitle)
                        .fixedSize(horizontal: false, vertical: false)
                    
                }
            }
        }
    }
}

struct ProjectLoadingView: View {
    @EnvironmentObject var projectDatastore: ProjectStore
    var body: some View {
//        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("Loading").disabled(self.projectDatastore.isLoading)
                    if #available(iOS 14.0, *) {
                        ProgressView()
                    } else {
                        Text("...")
                    }
                }.frame(width: geometry.size.width / 2,
                        height: geometry.size.height / 5)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.projectDatastore.isLoading ? 1 : 0)
            }.background(Color.blue.opacity(0.5))
//        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static let store = ProjectStore()
    
    static var previews: some View {
        ProjectView().environmentObject(store)
    }
}

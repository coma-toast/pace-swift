//
//  ProjectView.swift
//  PaCE
//
//  Created by Jason Dale on 8/23/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ProjectView: View {
    @ObservedObject var viewModel = ProjectViewModel()
    
    var body: some View {
        ForEach(viewModel.projects, id: \.id) { project in
            NavigationLink(destination: ProjectDetail(project: project)) {
                HStack{
                    Icon(project: project)
                    VStack(alignment: .leading) {
                        Text(project.name)
                        Text(project.clientName).font(.subheadline)
                    }
                    Spacer()
                }.frame(minWidth: 0, maxWidth: .infinity).padding().border(Color.gray, width: 1).shadow(radius: 0.5)
            } .buttonStyle(PlainButtonStyle())
        }
    }
}

extension ProjectView {
    struct Icon: View {
        let project: Project
        var body: some View {
            ZStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 3)
                
                VStack{
                    Text(String(project.name))
                        .font(.largeTitle)
                        .fixedSize(horizontal: false, vertical: false)
                    
                }
            }
        }
    }
    struct Address: View {
        let project: Project
        var body: some View {
            VStack {
                Text(project.address)
                HStack {
                    Text(project.city)
                    Text(project.state)
                    Text(String(project.zip))
                }
            }
        }
    }
    struct PrimaryContact: View {
        let project: Project
        var body: some View {
            VStack {
                Text(project.primaryContactName)
                Text(project.primaryContactPhone)
                Text(project.primaryContactEmail)
            }
        }
    }
}


struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}

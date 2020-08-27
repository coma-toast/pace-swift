//
//  ProjectDetail.swift
//  PaCE
//
//  Created by Jason Dale on 8/23/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct ProjectDetail: View {
    let project: Project
    var body: some View {
        VStack{
            ProjectView.Icon(project: project)
            Divider()
            VStack(alignment: .leading) {
                Text(project.clientName)
                Text(project.startDate)
                Text(project.dueDate)
                ProjectView.Address(project: project)
                Text(project.projectManager)
                Text(project.eORName)
                Text(project.detailerName)
                Text(project.inspectionLab)
                Text(project.steelErectorName)
//                Text(project.steelFabricatorName)
//                Text(project.generalContractor)
                ProjectView.PrimaryContact(project: project)
//                Text(project.squareFootage)
//                Text(project.weightInTons)
            }
        }
    }
}

//struct ProjectDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetail()
//    }
//}

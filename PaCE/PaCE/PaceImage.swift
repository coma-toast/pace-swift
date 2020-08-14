//
//  PaceImage.swift
//  PaCE
//
//  Created by Jason Dale on 8/13/20.
//  Copyright © 2020 Jason Dale. All rights reserved.
//

import SwiftUI

struct PaceImage: View {
    var body: some View {
        Image("crane")
            .resizable().aspectRatio(contentMode: .fit)
    }
}

struct PaceImage_Previews: PreviewProvider {
    static var previews: some View {
        PaceImage()
    }
}

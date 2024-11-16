//
//  ResourcesView.swift
//  DatafileOrganizer
//
//  Created by Massimo Montanaro on 16/11/24.
//

import SwiftUI

struct ResourcesView: View {
    // @State private var selectedProgramPath: String = ""
    var body: some View {
        VStack {
            Button(action: {
                guard let resourcesURL = Bundle.main.resourceURL else {
                    print("Could not find resources URL")
                    return
                }
                let repoName = "/tools"
                let localRepoPath = resourcesURL.path + repoName
                print(shellCommand("git clone https://github.com/mm-110/datafiles-management-toolkit.git \(localRepoPath) " ))
                print(shellCommand("ls \(resourcesURL.path)"))
            }) {
                Text("Run")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    ResourcesView()
}

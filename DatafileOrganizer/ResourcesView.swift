//
//  ResourcesView.swift
//  DatafileOrganizer
//
//  Created by Massimo Montanaro on 16/11/24.
//

import SwiftUI

struct ResourcesView: View {
    @State private var selectedProgramPath: String = ""
    var body: some View {
        Text(selectedProgramPath)
        Button(action: load) {
            Text("Load")
        }
    }
    
    func load() {
        if let filelocation = Bundle.main.url(forResource: "mgmt_folder", withExtension: "py") {
            selectedProgramPath = filelocation.path()
        }
    }
}

#Preview {
    ResourcesView()
}

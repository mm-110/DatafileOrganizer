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
            Button (action: {
                if let output = shell("/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 --version") {
                    print(output)
                } else {
                    print("Error ")
                }
                    
            }) {
                Text("Exec")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    ResourcesView()
}

//
//  CloneToolsView.swift
//  DatafileOrganizer
//
//  Created by Massimo Montanaro on 16/11/24.
//

import SwiftUI

struct CloneToolsView: View {
    
    let localRepositoryName: String = "tools"
    @State private var githubRepository: String = "https://github.com/mm-110/datafiles-management-toolkit.git"
    let iconDimesion: CGFloat = CGFloat(80)
    
    var body: some View {
        VStack {
            
            Image(systemName: "square.and.arrow.down.badge.checkmark.fill")
                .resizable()
                .frame(width: iconDimesion, height:  iconDimesion)
                .foregroundColor(.blue)
            Text("Clone tools from GitHub")
                .font(.title)
                .bold()
            TextField("Inserisci qui", text: $githubRepository) .textFieldStyle(RoundedBorderTextFieldStyle()) .padding()
            Button(action: {
                guard let resourcesURL = Bundle.main.resourceURL else {
                    print("Resources not found")
                    return
                }
                let resourcesPath = resourcesURL.path
                print("Resources URL: \(resourcesPath)")
                let repoPath = resourcesPath + "/" + localRepositoryName
                print("Repo path: \(repoPath)")
                print(shellCommandAndWait("rm -rf \(repoPath)"))
                print(shellCommandAndWait("git clone \(githubRepository) \(repoPath)"))
            }) {
                Text("Clone")
                    .frame(width: 150, height: 20)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
        
}

#Preview {
    CloneToolsView()
}

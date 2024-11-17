//
//  HomeView.swift
//  DatafileOrganizer
//
//  Created by Massimo Montanaro on 17/11/24.
//

import SwiftUI

struct HomeView: View {
    let iconDimesion: CGFloat = CGFloat(70)
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: iconDimesion, height:  iconDimesion)
                    .foregroundColor(.blue)
                Text("Home")
                    .font(.title)
                    .bold()
                NavigationLink(destination: CloneToolsView()) {
                    Text("Clone Tools")
                        .frame(width: 150, height: 10)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                }
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: ToolsView()) {
                    Text("Use Tools")
                        .frame(width: 150, height: 10)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            

        }
    }
}

#Preview {
    HomeView()
}

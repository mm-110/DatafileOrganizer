//
//  DatafileOrganizerApp.swift
//  DatafileOrganizer
//
//  Created by Massimo Montanaro on 15/11/24.
//

import SwiftUI

@main
struct DatafileOrganizerApp: App {
    var body: some Scene {
//
        WindowGroup {
            HomeView()
        }
        .defaultSize(width: 100, height: 200)
        
        WindowGroup {
            CloneToolsView()
        }
        .defaultSize(width: 300, height: 200)
        
        WindowGroup {
            ToolsView()
        }
        .defaultSize(width: 300, height: 200)
        
//        WindowGroup {
//            ContentView()
//        }
//        .defaultSize(width: 300, height: 200)
        
        
    }
}

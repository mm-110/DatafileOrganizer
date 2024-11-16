//
//  Utils.swift
//  DatafileOrganizer
//
//  Created by Massimo Montanaro on 15/11/24.
//

import Foundation

func runPythonScript(scriptName: String, arguments: [String] = []){
    let process = Process()
    
    let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let scriptURL = currentDirectoryURL.appendingPathComponent(scriptName)
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = ["python3"] + arguments
    
    let pipe = Pipe()
    process.standardOutput = pipe
    process.standardError = pipe
    
    do {
        try process.run()
        process.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print(output)
        }
        
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}




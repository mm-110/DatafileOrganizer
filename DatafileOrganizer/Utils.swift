import Foundation

@discardableResult
func shellCommand(_ command: String) -> String? {
    let process = Process()
    let pipe = Pipe()
    
    process.standardOutput = pipe
    process.standardError = pipe
    process.arguments = ["-c", command]
    process.launchPath = "/bin/zsh"
    process.standardInput = nil
    
    do {
        try process.run()
//        process.waitUntilExit()  // Aspetta la terminazione del processo
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        return output
        
    } catch {
        print("Error: \(error.localizedDescription)")
        return nil
    }
}

@discardableResult
func shellCommandAndWait(_ command: String) -> String? {
    let process = Process()
    let pipe = Pipe()
    
    process.standardOutput = pipe
    process.standardError = pipe
    process.arguments = ["-c", command]
    process.launchPath = "/bin/zsh"
    process.standardInput = nil
    
    do {
        try process.run()
        process.waitUntilExit()  // Aspetta la terminazione del processo
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        return output
        
    } catch {
        print("Error: \(error.localizedDescription)")
        return nil
    }
}

func getFolderPathFromResources(folderName: String) -> String? {
    guard let resourcesURL = Bundle.main.resourceURL else {
        print("Resources not found")
        return nil
    }
    let resourcesPath = resourcesURL.path
    print("Resources URL: \(resourcesPath)")
    let folderPath = resourcesPath + "/" + folderName
    return folderPath
}

func listFilesInDirectory(atPath path: String) -> [String] {
    let fileManager = FileManager.default
    do {
        // Ottieni il contenuto della directory
        let items = try fileManager.contentsOfDirectory(atPath: path)
        return items
    } catch {
        print("Errore durante la lettura del contenuto della directory: \(error.localizedDescription)")
        return []
    }
}

//@discardableResult
//func shell(_ command: String, in directory: URL) -> String? {
//    let process = Process()
//    let pipe = Pipe()
//    process.standardOutput = pipe
//    process.standardError = pipe
//    process.arguments = ["-c", command]
//    process.launchPath = "/bin/zsh"
//    process.standardInput = nil
//    process.currentDirectoryURL = directory
//    do {
//        try process.run()
//        //        process.waitUntilExit()
//        let data = pipe.fileHandleForReading.readDataToEndOfFile()
//        let output = String(data: data, encoding: .utf8)
//        return output
//    } catch {
//        print("Error: \(error.localizedDescription)")
//        return nil
//    }
//}
//
//func runPythonScript(scriptName: String, arguments: [String] = []) {
//    guard let scriptURL = Bundle.main.url(forResource: scriptName, withExtension: "py") else {
//        print("Invalid script path")
//        return
//    }
//    let scriptPath = scriptURL.path
//    let argumentsString = arguments.joined(separator: " ")
//    let command = "python3 \(scriptPath) \(argumentsString)"
//    print(command)
//    
//    // Esegui il comando e stampa l'output
//    if let output = shellCommand(command) {
//        print(output)
//    } else {
//        print("Error executing shell command")
//    }
//}

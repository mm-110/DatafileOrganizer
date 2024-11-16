import Foundation

@discardableResult
func shell(_ command: String) -> String? {
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

func runPythonScript(scriptName: String, arguments: [String] = []) {
    guard let scriptURL = Bundle.main.url(forResource: scriptName, withExtension: "py") else {
        print("Invalid script path")
        return
    }
    let scriptPath = scriptURL.path
    let argumentsString = arguments.joined(separator: " ")
    let command = "python3 \(scriptPath) \(argumentsString)"
    print(command)
    
    // Esegui il comando e stampa l'output
    if let output = shell(command) {
        print(output)
    } else {
        print("Error executing shell command")
    }
}

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var isDocumentPickerPresented = false
    @State private var selectedFolderPath: String = ""
    @State private var selectedProgramPath: String = ""
    @State private var filesInCurrentDirectory: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            // Icona della cartella pulsante molto grande
            
            let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            
            Text(currentDirectoryURL.path)

            Image(systemName: "folder.fill.badge.gear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .background(Color.clear)
                .padding()
            
            // Nome dell'app un po' più piccolo
            Text("Datafile Organizer")
                .font(.system(size: 18))
                .bold()
            
            // HStack con casella testuale e bottone per il document picker
            HStack {
                TextField("Percorso della cartella", text: $selectedFolderPath)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    isDocumentPickerPresented = true
                }) {
                    Text("Select Folder")
                }

            }
            
            Button(action: {
//                runPythonScript(scriptName: "mgmt_folder", arguments: [selectedFolderPath, "_", "0"])
            }) {
                Text("RUN")
                 .frame(width:140, height: 40)
            }
            .padding()
            
            Button(action: {
                listFilesInCurrentDirectory()
            }) {
                Text("List Files")
                    .frame(width: 140, height: 40)
            }
            .padding()
            
            List(filesInCurrentDirectory, id: \.self) {file in Text(file)}
            
            
        }
        .padding()
        .fileImporter(
            isPresented: $isDocumentPickerPresented,
            allowedContentTypes: [.folder],
            allowsMultipleSelection: false,
            onCompletion: { result in
                do {
                    let selectedFolder = try result.get().first
                    selectedFolderPath = selectedFolder?.path ?? ""
                } catch {
                    print("Errore durante la selezione della cartella: \(error.localizedDescription)")
                }
            }
        )
    }
    func listFilesInCurrentDirectory(){
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: currentDirectoryURL.path)
            filesInCurrentDirectory = files
            print("Files in current directory: \(files)")
        } catch {
            print("Error reading contents")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

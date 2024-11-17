import SwiftUI

struct ToolsView: View {
    let toolsDirName: String = "tools"
    @State private var selectedTool = ""
    @State private var tools: [String] = []
    let iconDimesion: CGFloat = CGFloat(80)
    
    @State private var isDocumentPickerPresented = false
    @State private var selectedFolderPath: String = ""
    
    var body: some View {
        VStack {
            
            Image(systemName: "square.and.arrow.down.badge.checkmark.fill")
                .resizable()
                .frame(width: iconDimesion, height:  iconDimesion)
                .foregroundColor(.blue)
            
            Text("Select tool to run on folder")
                .font(.title)
                .bold()
            
            if tools.isEmpty {
                Text("No tools folder found")
                    .onAppear {
                        loadTools()
                    }
            } else {
                Picker("Select a tool", selection: $selectedTool) {
                    ForEach(tools, id: \.self) { tool in
                        Text(tool)
                            .tag(tool)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
            }
            HStack {
                Button(action: {
                    isDocumentPickerPresented = true
                }) {
                    Text("Select Folder")
                }
                
                TextField("Percorso della cartella", text: $selectedFolderPath)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .padding(.horizontal)
            
            Button(action: {
                // Azione del pulsante Clone
            }) {
                Text("Run")
                    .frame(width: 150, height: 20)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    func loadTools() {
        guard let toolsFullPath = getFolderPathFromResources(folderName: toolsDirName) else {
            print("No tools folder found")
            return
        }
        tools = listFilesInDirectory(atPath: toolsFullPath)
    }
}

//func getFolderPathFromResources(folderName: String) -> String? {
//    // Implementazione della funzione per ottenere il percorso della cartella dai resources
//    return Bundle.main.path(forResource: folderName, ofType: nil)
//}
//
//func listFilesInDirectory(atPath path: String) -> [String] {
//    let fileManager = FileManager.default
//    do {
//        let items = try fileManager.contentsOfDirectory(atPath: path)
//        return items
//    } catch {
//        print("Errore durante la lettura del contenuto della directory: \(error.localizedDescription)")
//        return []
//    }
//}

#Preview {
    ToolsView()
}

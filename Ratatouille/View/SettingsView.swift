import SwiftUI
import SwiftData

struct SettingsView: View {
    @AppStorage("isDarkMode") private var darkMode = false
    
    @State private var database = ""
    
    var body: some View 
    {
        NavigationStack 
        {
            List 
            {
                NavigationLink(destination: AreaView()) {
                    Label("Redigere landområder", systemImage: "globe")
                }
                
                NavigationLink(destination: CategoryView()) {
                    Label("Redigere kategorier", systemImage: "rectangle.3.group.bubble")
                }
                
                NavigationLink(destination: IngredientView()) {
                    Label("Redigere ingredienser", systemImage: "carrot.fill")
                }

                Section
                {
                    Toggle(isOn: $darkMode) 
                    {
                        Label("Aktiver mørk modus", systemImage: "moon.circle")
                    }
                }
                
                Section {
                    NavigationLink(destination: ArchiveView()) {
                        Label("Administrere arkiv", systemImage: "archivebox.fill")
                    }
                }
                
                Section {
                    NavigationLink(destination: ImportView()) {
                        Label("Importer data", systemImage: "square.and.arrow.down.on.square.fill")
                    }
                }
                
                Button
                {
                  guard let urlApp = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).last
                  else
                  {
                    return
                  }
                  
                  let url = urlApp.appendingPathComponent("default.store")
                  if FileManager.default.fileExists(atPath: url.path)
                  {
                    database = url.absoluteString
                      print(database)
                  }
                }
                label:
                {
                  Label("Vis database lokasjon", systemImage: "internaldrive.fill")
                }
            }
            .navigationTitle("Innstillinger")
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView().modelContainer(for: [CategoryModel.self, AreaModel.self])
}

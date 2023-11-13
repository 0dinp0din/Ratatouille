import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var darkMode = false
    
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
                        Label("Importer", systemImage: "square.and.arrow.down.on.square.fill")
                    }
                }
            }
            .navigationTitle("Innstillinger")
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}

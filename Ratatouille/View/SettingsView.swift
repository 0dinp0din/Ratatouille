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

                Section
                {
                    Toggle(isOn: $darkMode) 
                    {
                        Label("Aktiver mørk modus", systemImage: "moon.circle")
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

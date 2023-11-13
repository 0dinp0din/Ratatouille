import SwiftUI
import SwiftData

struct MainView: View {

    var body: some View {
        TabView {
            RecipeView().tabItem {
                Label("Mine oppskrifter", systemImage: "fork.knife.circle.fill")
            }
            
            SearchView().tabItem {
                Label("Søk", systemImage: "magnifyingglass.circle.fill")
            }
            
            SettingsView().tabItem {
                Label("Innstillinger", systemImage: "gearshape.fill")
            }
        }
    }
        
}

#Preview {
    MainView()
}

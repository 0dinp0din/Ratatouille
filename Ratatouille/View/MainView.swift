import SwiftUI
import SwiftData

struct MainView: View {
    @AppStorage("isDarkMode") var darkMode = false

    var body: some View {
        
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .background()
            
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
        }.background().environment(\.colorScheme, darkMode ? .dark : .light)

    }
        
}

#Preview {
    MainView().modelContainer(for: [CategoryModel.self, AreaModel.self, IngredientModel.self, RecipeModel.self])
}

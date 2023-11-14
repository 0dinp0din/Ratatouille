import SwiftUI
import SwiftData

struct RecipeView: View {
    
    @AppStorage("isDarkMode") private var darkMode = false
    
    @Query private var recipes: [RecipeModel]
    
    var body: some View {
        NavigationStack {
            Group {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .background()
                
                
                if recipes.isEmpty {
                    ContentUnavailableView("Ingen matoppskrifter", systemImage: "square.stack.3d.up.slash")
                }
            }
        }.navigationTitle("Matoppskrifter")
    }
}

#Preview {
    RecipeView().modelContainer(for: RecipeModel.self)
}

import SwiftUI
import SwiftData

struct RecipeView: View {
    
    @AppStorage("isDarkMode") private var darkMode = false
    
    @Query private var recipes: [RecipeModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if recipes.isEmpty {
                    ContentUnavailableView("Ingen matoppskrifter", systemImage: "square.stack.3d.up.slash")
                }
            }
        }
    }
}

#Preview {
    RecipeView().modelContainer(for: RecipeModel.self)
}

import SwiftUI
import SwiftData

struct RecipeView: View {
    
    @AppStorage("isDarkMode") private var darkMode = false
    
    @Query(filter: #Predicate<RecipeModel>{$0.trash == false}) private var recipes: [RecipeModel]
    
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
                } else {
                    List {
                        ForEach(recipes) { recipe in
                            
                            NavigationLink(destination: ShowRecipeView(recipe)) {
                                RecipeRow(recipe)
                            }
                            
                        }
                    }
                }
            }
        }.navigationTitle("Matoppskrifter")
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    RecipeView().modelContainer(for: RecipeModel.self)
}

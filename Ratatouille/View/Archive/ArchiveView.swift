import SwiftData
import SwiftUI

struct ArchiveView: View
{
  @AppStorage("isDarkMode") private var darkMode = false
  
  var body: some View
  {
    NavigationStack
    {
      List
      {
        Section("Landområder")
        {
            ArchiveArea()
        }
        
        Section("Kategorier")
        {
          ArchiveCategory()
        }
        
        Section("Ingredienser")
        {
          ArchiveIngredient()
        }
        
        Section("Matoppskrifter")
        {
          ArchiveRecipe()
        }
      }
      .navigationTitle("Arkiv")
    }
    .environment(\.colorScheme, darkMode ? .dark : .light)
  }
}

#Preview
{
    ArchiveView().modelContainer(for: [CategoryModel.self, AreaModel.self, IngredientModel.self, RecipeModel.self])
}

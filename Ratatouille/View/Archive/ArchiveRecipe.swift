import SwiftData
import SwiftUI

struct ArchiveRecipe: View
{
  @Environment(\.modelContext) private var context
  @Query(filter: #Predicate<RecipeModel>{$0.trash == true},
         sort: \RecipeModel.archiveDate, order: .reverse) private var recipes: [RecipeModel]
  
  var body: some View
  {
    if recipes.isEmpty
    {
      Label("Ingen arkiverte matoppskrifter", systemImage: "fork.knife.circle.fill")
    }
    else
    {
      ForEach(recipes)
      {
          recipe in
        
        VStack(alignment: .leading)
        {
            Text(recipe.strMeal).font(.title3.weight(.bold))
          Text("Arkivert: \(recipe.archiveDate.formatted(date: .abbreviated, time: .standard))")
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button("", systemImage: "trash.fill", role: .destructive)
          {
            context.delete(recipe)
          }
          
          Button("", systemImage: "tray.and.arrow.up.fill", role: .cancel)
          {
              recipe.archiveDate = Date.now
              recipe.trash = false
          }
          .tint(Color.mint)
        }
      }
    }
  }
}

#Preview
{
    ArchiveRecipe()
}

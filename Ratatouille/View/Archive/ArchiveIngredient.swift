import SwiftData
import SwiftUI

struct ArchiveIngredient: View
{
  @Environment(\.modelContext) private var context
  @Query(filter: #Predicate<IngredientModel>{$0.trash == true},
         sort: \IngredientModel.archiveDate, order: .reverse) private var ingredients: [IngredientModel]
  
  var body: some View
  {
    if ingredients.isEmpty
    {
      Label("Ingen arkiverte ingredienser", systemImage: "carrot.fill")
    }
    else
    {
      ForEach(ingredients)
      {
          ingredient in
        
        VStack(alignment: .leading)
        {
          Text(ingredient.strIngredient).font(.title3.weight(.bold))
          Text("Arkivert: \(ingredient.archiveDate.formatted(date: .abbreviated, time: .standard))")
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button("", systemImage: "trash.fill", role: .destructive)
          {
            context.delete(ingredient)
          }
          
          Button("", systemImage: "tray.and.arrow.up.fill", role: .cancel)
          {
              ingredient.archiveDate = Date.now
              ingredient.trash = false
          }
          .tint(Color.mint)
        }
      }
    }
  }
}

#Preview
{
    ArchiveIngredient()
}

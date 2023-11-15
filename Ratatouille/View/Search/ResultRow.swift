import SwiftData
import SwiftUI

struct ResultRow: View
{
    @Environment(\.modelContext) private var context
    @State private var recipe: Recipe
  
      init(_ recipe: Recipe) {
        self.recipe = recipe
      }
  
  var body: some View
    {
        HStack(alignment: .center)
        {
            VStack(alignment: .leading)
            {
                HStack {
                    
                    AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    VStack {
                        Text(recipe.strMeal ?? "Unknown title").font(.title2)
                    }
                }
                
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
            Button()
            {
                let recipe = RecipeModel(
                    strMeal: recipe.strMeal ?? "Unknown title",
                    strMealThumb: recipe.strMealThumb ?? "Unknown"
                )
                context.insert(recipe)
            }
        label:
            {
                Image(systemName: "square.grid.3x1.folder.fill.badge.plus")
            }
        }
    }
}

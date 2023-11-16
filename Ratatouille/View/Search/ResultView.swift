import SwiftUI

struct ResultView: View
{
    @Environment(\.modelContext) private var context
    
    @State private var recipe: Recipe
    @State private var recipeId: String
  
    init(recipe: Recipe, recipeId: String) {
        self.recipe = recipe
        self.recipeId = recipeId
          
      }
    
  var body: some View
    {
        NavigationStack {
            List {
                VStack {
                    Text(recipe.strMeal ?? "Unknown title").font(.largeTitle)
                    AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Section("Instruksjon") {
                        Text(recipe.strInstructions ?? "Unknown")
                    }
                }
            }
        }.task {
            recipe = await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)").first!
        }


    }
}

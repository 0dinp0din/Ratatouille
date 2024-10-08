import SwiftData
import SwiftUI

struct ResultRow: View
{
    @Environment(\.modelContext) private var context
    @State private var recipe: Recipe
    @State private var recipeId: String
    @State private var showAlert = false
  
    init(recipe: Recipe, recipeId: String) {
        self.recipe = recipe
        self.recipeId = recipeId
          
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
                    strMeal: recipe.strMeal ?? "Ukjent tittel",
                    strMealThumb: recipe.strMealThumb ?? "https://media.npr.org/assets/img/2016/07/21/emptyplate3_sq-e28860c5cd33831be0ae73b3508394d777c1bd8a.jpg",
                    strInstructions: recipe.strInstructions ?? ""
                )
                context.insert(recipe)
                showAlert = true
            }
        label:
            {
                Image(systemName: "square.grid.3x1.folder.fill.badge.plus")
            }
        }.task {
            do {
                let recipes = try await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)")
                
                if let firstRecipe = recipes.first {
                    print("No meal name")
                } else {
                    print("No recipes found")
                }
            } catch {
                print("Error fetching recipes")
            }

        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Matoppskriften er lagret"), dismissButton: .default(Text("Bekreft")))
        }
    }
}

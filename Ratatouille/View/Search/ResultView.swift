import SwiftUI

struct ResultView: View
{
    @Environment(\.modelContext) private var context
    @State private var recipe: Recipe
  
      init(_ recipe: Recipe) {
        self.recipe = recipe
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
                    
                }
            }
        }


    }
}

#Preview {
    ResultView(Recipe(idMeal: "23", strMeal: "Lapskaus", strCategory: "", strInstructions: "wsss", strMealThumb: "https://www.themealdb.com/images/media/meals/q8sp3j1593349686.jpg", strTags: "sddds", strArea: "sddsds"))
}

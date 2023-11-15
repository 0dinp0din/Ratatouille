import SwiftData
import SwiftUI

struct RecipeRow: View
{
    var recipe: RecipeModel
    
    init(_ recipe: RecipeModel)
    {
        self.recipe = recipe
    }
    
    var body: some View
    {
        HStack(alignment: .center)
        {
            VStack(alignment: .leading)
            {
                HStack {
                    
                    AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    VStack {
                        Text(recipe.strMeal).font(.title2)
                    }
                    
                    
                    if recipe.favorite
                    {
                      Spacer()
                      Image(systemName: "star.fill").foregroundColor(.yellow).font(.title2)
                    }
                }
                
            }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true)
        {
          Button
          {
            recipe.favorite.toggle()
          }
          label:
          {
            Image(systemName: "star.fill")
          }
          .tint(.yellow)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
            Button(role: .destructive)
            {
                recipe.trash = true
                recipe.archiveDate = .now
            }
        label:
            {
                Image(systemName: "tray.and.arrow.down.fill")
            }
        }
    }
}

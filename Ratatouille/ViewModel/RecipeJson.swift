import SwiftUI

struct RecipeResponse: Decodable {
    let meals: [Recipe]
}

struct Recipe: Identifiable, Decodable {
    var id: Int { Int(idMeal) ?? 0 }
    let idMeal: String
    
    let strMeal: String?
    let strCategory: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strArea: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
}



func getRecipes(url: String) async -> [Recipe]
{
  guard let connection = URL(string: url) else
  {
    return [Recipe]()
  }
  
  do
  {

    let (data, _) = try await URLSession.shared.data(from: connection)
      
      return try JSONDecoder().decode(RecipeResponse.self, from: data).meals
  }
  catch
  {
      print(error)
    return [Recipe]()
  }
}

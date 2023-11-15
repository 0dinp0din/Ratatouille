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

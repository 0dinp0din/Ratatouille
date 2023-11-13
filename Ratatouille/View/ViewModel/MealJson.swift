import SwiftUI

struct MealResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Identifiable, Decodable {
    var id: Int { Int(idMeal) ?? 0 }
    let idMeal: String
    
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
}



func getMeals(url: String) async -> [Meal]
{
  guard let connection = URL(string: url) else
  {
    return [Meal]()
  }
  
  do
  {

    let (data, _) = try await URLSession.shared.data(from: connection)
      
      return try JSONDecoder().decode(MealResponse.self, from: data).meals
  }
  catch
  {
      print(error)
    return [Meal]()
  }
}

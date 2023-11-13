import Foundation

struct IngredientResponse: Decodable {
    let meals: [Ingredient]
}

struct Ingredient: Identifiable, Decodable {
    var id: Int { Int(idIngredient) ?? 0 }
    let idIngredient: String
    
    let strIngredient: String
}

func getIngredient() async -> [Ingredient]
{
  guard let connection = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?i=list") else
  {

    return [Ingredient]()
  }
  
  do
  {

    let (data, _) = try await URLSession.shared.data(from: connection)
      
      return try JSONDecoder().decode(IngredientResponse.self, from: data).meals
  }
  catch
  {
      
    return [Ingredient]()
  }
}

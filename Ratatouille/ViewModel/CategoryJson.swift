import Foundation

struct CategoriesResponse: Decodable {
    let categories: [Category]
}

struct Category: Identifiable, Decodable {
    var id: Int { Int(idCategory) ?? 0 }
    
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

func getCategories() async -> [Category]
{
  guard let connection = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else
  {

    return [Category]()
  }
  
  do
  {

    let (data, _) = try await URLSession.shared.data(from: connection)
      
      return try JSONDecoder().decode(CategoriesResponse.self, from: data).categories
  }
  catch
  {
      
    return [Category]()
  }
}

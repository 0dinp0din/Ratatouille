import Foundation

struct AreaResponse: Decodable {
    let meals: [Area]
}

struct Area: Identifiable, Decodable {
    var id: String {
        strArea
    }
    
    let strArea: String
}

func getAreas() async -> [Area]
{
  guard let connection = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?a=list") else
  {

    return [Area]()
  }
  
  do
  {

    let (data, _) = try await URLSession.shared.data(from: connection)
      
      return try JSONDecoder().decode(AreaResponse.self, from: data).meals
  }
  catch
  {
      
    return [Area]()
  }
}

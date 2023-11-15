import SwiftUI
import SwiftData

struct SearchModal: View {
    @Binding var selectedButtonIndex: Int
    var updateData: ([Recipe]) -> Void
    @Query(filter: #Predicate<AreaModel>{$0.trash == false}) private var areas: [AreaModel]
    
    var body: some View {
        NavigationStack {
            
            switch selectedButtonIndex {
            case 0:
                List {
                    ForEach(areas) { area in
                        Button
                        {
                            Task {
                                let recipes = await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/random.php")
                                updateData(recipes)
                                print(recipes)
                            }
                          
                        }
                        label:
                        {
                            Text(area.strArea)
                        }
                    }
                }
            case 1:
                Text("Error")
            case 2:
                Text("Error")
            case 3:
                Text("Error")
            default:
                Text("Error")
            }
        }

    }
}

/*#Preview {
    SearchModal()
}*/

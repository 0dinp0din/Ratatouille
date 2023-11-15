import SwiftUI
import SwiftData

struct SearchModal: View {
    @Binding var selectedButtonIndex: Int
    @State var searchQuery: String = ""
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isDarkMode") private var darkMode = false
    
    var updateData: ([Recipe]) -> Void
    @Query(filter: #Predicate<AreaModel>{$0.trash == false}) private var areas: [AreaModel]
    @Query(filter: #Predicate<CategoryModel>{$0.trash == false}) private var categories: [CategoryModel]
    @Query(filter: #Predicate<IngredientModel>{$0.trash == false}) private var ingredients: [IngredientModel]
    
    var body: some View {
        NavigationStack {
            
            switch selectedButtonIndex {
            case 0:
                NavigationStack {
                    List {
                        ForEach(areas) { area in
                            Button
                            {
                                Task {
                                    let recipes = await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(area.strArea)")
                                    updateData(recipes)
                                }
                            }
                            label:
                            {
                                Text(area.strArea)
                            }
                        }
                    }.toolbar {
                        ToolbarItem(placement: .cancellationAction)
                        {
                          Button("Avbryt", role: .cancel)
                          {
                            dismiss()
                          }
                        }
                        
                        ToolbarItem(placement: .principal)
                        {
                          Text("Landområde")
                        }
                    }
                }
            case 1:
                NavigationStack {
                    List {
                        ForEach(categories) { category in
                            Button
                            {
                                Task {
                                    let recipes = await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category.strCategory)")
                                    updateData(recipes)
                                }
                            }
                            label:
                            {
                                Text(category.strCategory)
                            }
                        }
                    }.toolbar {
                        ToolbarItem(placement: .cancellationAction)
                        {
                          Button("Avbryt", role: .cancel)
                          {
                            dismiss()
                          }
                        }
                        
                        ToolbarItem(placement: .principal)
                        {
                          Text("Kategori")
                        }
                    }
                }
            case 2:
                NavigationStack {
                    List {
                        ForEach(ingredients) { ingredient in
                            Button
                            {
                                Task {
                                    let recipes = await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(ingredient.strIngredient)")
                                    updateData(recipes)
                                }
                            }
                            label:
                            {
                                Text(ingredient.strIngredient)
                            }
                        }
                    }.toolbar {
                        ToolbarItem(placement: .cancellationAction)
                        {
                          Button("Avbryt", role: .cancel)
                          {
                            dismiss()
                          }
                        }
                        
                        ToolbarItem(placement: .principal)
                        {
                          Text("Ingrediens")
                        }
                    }
                }
            case 3:
                NavigationStack {
                    Form {
                        TextField("Skriv søkeord", text: $searchQuery)
                    }
                }.toolbar {
                    ToolbarItem(placement: .cancellationAction)
                    {
                      Button("Avbryt", role: .cancel)
                      {
                        dismiss()
                      }
                    }
                    
                    ToolbarItem(placement: .principal)
                    {
                      Text("Frisøk")
                    }
                    
                    ToolbarItem(placement: .confirmationAction)
                    {
                      Button("Søk")
                      {
                          Task {
                              let recipes = await getRecipes(url: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchQuery.description)")
                              updateData(recipes)
                          }
                          
                          dismiss()
                      }.disabled(searchQuery.isEmpty)
                    }
                }
            default:
                Text("Error")
            }
        }

    }
}

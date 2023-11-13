import SwiftData
import SwiftUI

struct ImportView: View {
    @State private var categories: [Category] = []
    @State private var areas: [Area] = []
    @State private var status = ""
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        NavigationStack {
            List {
                Button {
                    Task {
                        categories = await getCategories()
                        
                        print(categories.count)
                        
                        if !categories.isEmpty {
                            for index in 0...categories.count-1 {
                                let category = CategoryModel(strCategory: categories[index].strCategory, strCategoryThumb: categories[index].strCategoryThumb, strCategoryDescription: categories[index].strCategoryDescription)
                                context.insert(category)
                            }
                            status += "kategoriene er lagret i databasen. \n "
                        } else {
                            status += "Error \n"
                        }
                    }
                } label: {
                    Label("Importer kategorier til databasen", systemImage: "square.and.arrow.down.on.square.fill")
                }
                
                
                //button 2
                Button {
                    Task {
                        areas = await getAreas()
                        
                        print(areas.count)
                        
                        if !areas.isEmpty {
                            for index in 0...areas.count-1 {
                                let area = AreaModel(strArea: areas[index].strArea)
                                context.insert(area)
                            }
                            status += "kategoriene er lagret i databasen. \n "
                        } else {
                            status += "Error \n"
                        }
                    }
                } label: {
                    Label("Importer områder til databasen", systemImage: "square.and.arrow.down.on.square.fill")
                }
                
                Section("Informasjon")
                {
                  Text(status)
                }
                
                Button
                {
                  do
                  {
                    try context.delete(model: CategoryModel.self)
                      
                  }
                  catch
                  {
                    status += "Feil ved sletting av kategoriene i databasen.\n"
                  }
                  status += "Kategorier er slettet fra databasen.\n"
                }
                label:
                {
                  Label("Slett kategorier i databasen", systemImage: "square.stack.3d.up")
                }
            }
        }
    }
}

#Preview
{
    MainActor.assumeIsolated {
        ImportView().modelContainer(for: [CategoryModel.self, AreaModel.self])
    }

}

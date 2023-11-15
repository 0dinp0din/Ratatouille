import SwiftData
import SwiftUI

struct ArchiveCategory: View
{
  @Environment(\.modelContext) private var context
  @Query(filter: #Predicate<CategoryModel>{$0.trash == true},
         sort: \CategoryModel.archiveDate, order: .reverse) private var categories: [CategoryModel]
  
  var body: some View
  {
    if categories.isEmpty
    {
      Label("Ingen arkiverte kategorier", systemImage: "rectangle.3.group.bubble")
    }
    else
    {
      ForEach(categories)
      {
          category in
        
        VStack(alignment: .leading)
        {
          Text(category.strCategory).font(.title3.weight(.bold))
          Text("Arkivert: \(category.archiveDate.formatted(date: .abbreviated, time: .standard))")
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button("", systemImage: "trash.fill", role: .destructive)
          {
            context.delete(category)
          }
          
          Button("", systemImage: "tray.and.arrow.up.fill", role: .cancel)
          {
              category.archiveDate = Date.now
              category.trash = false
          }
          .tint(Color.mint)
        }
      }
    }
  }
}

#Preview
{
    ArchiveCategory()
}

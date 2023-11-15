import SwiftData
import SwiftUI

struct ArchiveArea: View
{
  @Environment(\.modelContext) private var context
  @Query(filter: #Predicate<AreaModel>{$0.trash == true},
         sort: \AreaModel.archiveDate, order: .reverse) private var areas: [AreaModel]
  
  var body: some View
  {
    if areas.isEmpty
    {
      Label("Ingen arkiverte landområder", systemImage: "globe")
    }
    else
    {
      ForEach(areas)
      {
          area in
        
        VStack(alignment: .leading)
        {
          Text(area.strArea).font(.title3.weight(.bold))
          Text("Arkivert: \(area.archiveDate.formatted(date: .abbreviated, time: .standard))")
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
          Button("", systemImage: "trash.fill", role: .destructive)
          {
            context.delete(area)
          }
          
          Button("", systemImage: "tray.and.arrow.up.fill", role: .cancel)
          {
              area.archiveDate = Date.now
              area.trash = false
          }
          .tint(Color.mint)
        }
      }
    }
  }
}

#Preview
{
    ArchiveArea()
}

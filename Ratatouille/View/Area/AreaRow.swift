import SwiftData
import SwiftUI

struct AreaRow: View
{
  var area: AreaModel
  
  init(_ area: AreaModel)
  {
    self.area = area
  }
  
  var body: some View
  {
    NavigationLink(value: area)
    {
      HStack(alignment: .center)
      {
        VStack(alignment: .leading)
        {
            HStack {
                
                AsyncImage(url: URL(string: "https://flagsapi.com/\(area.countryCode)/shiny/64.png")) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
                
                Text(area.strArea)
            }
            
        }
      }
      .swipeActions(edge: .trailing, allowsFullSwipe: false)
      {
        Button(role: .destructive)
        {
            area.trash = true
            area.archiveDate = .now
        }
        label:
        {
          Image(systemName: "tray.and.arrow.down.fill")
        }
      }
    }
  }
}

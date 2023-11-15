import SwiftData
import SwiftUI

struct ResultRow: View
{
    
    @State private var recipe: Recipe
  
      init(_ recipe: Recipe) {
        self.recipe = recipe
      }
  
  var body: some View
    {
        HStack(alignment: .center)
        {
            VStack(alignment: .leading)
            {
                HStack {
                    
                    /*AsyncImage(url: URL(string: "https://flagsapi.com/\(area.countryCode)/shiny/64.png")) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(area.strArea)*/
                }
                
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
            Button(role: .destructive)
            {
                
            }
        label:
            {
                Image(systemName: "square.grid.3x1.folder.fill.badge.plus")
            }
        }
    }
}

import SwiftData
import SwiftUI

struct CategoryRow: View
{
  var category: CategoryModel
  
  init(_ category: CategoryModel)
  {
    self.category = category
  }
  
  var body: some View
  {
    NavigationLink(value: category)
    {
      HStack(alignment: .center)
      {
        VStack(alignment: .leading)
        {
            HStack {
                
                AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
                
                Text(category.strCategory)
            }
            
        }
      }
      .swipeActions(edge: .trailing, allowsFullSwipe: false)
      {
        Button(role: .destructive)
        {
            category.trash = true
            category.archiveDate = .now
        }
        label:
        {
          Image(systemName: "tray.and.arrow.down.fill")
        }
      }
    }
  }
}

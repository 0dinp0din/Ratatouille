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
        HStack(alignment: .center)
        {
            VStack(alignment: .leading)
            {
                HStack {
                    
                    AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(category.strCategory).font(.title2)
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

import SwiftData
import SwiftUI

struct IngredientRow: View
{
    var ingredient: IngredientModel
    
    init(_ ingredient: IngredientModel)
    {
        self.ingredient = ingredient
    }
    
    var body: some View
    {
        HStack(alignment: .center)
        {
            VStack(alignment: .leading)
            {
                HStack {
                    Text(ingredient.strIngredient)
                }
                
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false)
        {
            Button(role: .destructive)
            {
                ingredient.trash = true
                ingredient.archiveDate = .now
            }
        label:
            {
                Image(systemName: "tray.and.arrow.down.fill")
            }
        }
    }
}

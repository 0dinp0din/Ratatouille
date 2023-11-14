import SwiftUI
import SwiftData

struct AreaView: View {
    @AppStorage("isDarkMode") private var darkMode = false
    
    @Query private var areas: [AreaModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if areas.isEmpty {
                    ContentUnavailableView("Ingen landområder", systemImage: "square.stack.3d.up.slash")
                } else {
                    List(areas) {
                        area in
                        
                        AreaRow(area)
                    }
                }
            }
        }
    }
}

#Preview {
    AreaView().modelContainer(for: AreaModel.self)
}

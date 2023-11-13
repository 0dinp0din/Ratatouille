import SwiftUI
import SwiftData

@main
struct RatatouilleApp: App {
    @State var isSplash = true
    
    var body: some Scene {
        WindowGroup {
            
            if isSplash {
                SplashView(splash: $isSplash)
            }
            else {
                MainView()
            }
        }
    }
}

import SwiftUI

struct SplashView: View
{
    @Binding var splash: Bool
    
    @State private var radius = 50.0
    @State private var degree = 0.0
    @State private var scale = 0.2
    @State private var hatOffset = -3000
    
    var body: some View
    {
        ZStack
        {
            RadialGradient(gradient: Gradient(colors: [.black]), center: .center, startRadius: 2, endRadius: radius)
            VStack
            {
                
                Image("splashrat").rotationEffect(.degrees(degree))
            }
            .scaleEffect(scale)
            .onAppear
            {
                withAnimation(.easeIn(duration: 3)) {
                    self.radius = 300
                    self.degree = 360
                    self.scale = 0.5
                }
            }
            
            VStack {
                Image("splashhat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(x: CGFloat(50), y: CGFloat(hatOffset))
                    .rotationEffect(.degrees(-10))
            }
            .scaleEffect(scale)
                .onAppear
                {
                    withAnimation(.easeIn(duration: 3)) {
                        self.hatOffset = -200
                    }
                }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline:
                .now() + 3.0)
            {
                withAnimation(.easeOut(duration: 2.0))
                {
                    self.splash = false
                }
            }
        }
    }
}

#Preview
{
  SplashView(splash: .constant(true))
}

import SwiftUI

struct WelcomeView: View {
    var next: () -> Void
    var viewHistory: () -> Void  // 新增：跳转到历史页

    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to BrewMate")
                .font(.largeTitle)
                .bold()

            Text("Let us help you find the perfect coffee!")
                .font(.subheadline)

            Button("Start Recommendation", action: next)
                .buttonStyle(.borderedProminent)

            Button("View History", action: viewHistory)
                .buttonStyle(.bordered)
        }
        .padding()
    }
}


import SwiftUI

struct ContentView: View {
    @State private var selectedBodyPart: BodyPart?
    @State private var showBodyPartsList = false
    @State private var rotationAngle: Double = 0
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [Color(.systemBackground), Color(.systemGray6)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    headerView
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                    // 3D Model Area
                    BodyModelView(
                        selectedBodyPart: $selectedBodyPart,
                        rotationAngle: $rotationAngle,
                        scale: $scale
                    )
                    .padding(.vertical, 20)
                    
                    // Bottom Button
                    viewAllButton
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                }
            }
            .sheet(isPresented: $showBodyPartsList) {
                BodyPartsListView(selectedBodyPart: $selectedBodyPart)
            }
            .sheet(item: $selectedBodyPart) { bodyPart in
                BodyPartDetailView(bodyPart: bodyPart)
            }
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                Text("💪")
                    .font(.system(size: 40))
                Text("Body Workout Guide")
                    .font(.system(size: 32, weight: .bold))
                    .minimumScaleFactor(0.8)
                Spacer()
            }
            
            Text("Tap any body part to start")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var viewAllButton: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                showBodyPartsList = true
            }
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 20, weight: .semibold))
                Text("View All Body Parts")
                    .font(.system(size: 18, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
                LinearGradient(
                    colors: [Color.blue, Color.blue.opacity(0.8)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
            .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// Custom button style for scale animation
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}

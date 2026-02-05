import SwiftUI

struct BodyModelView: View {
    @Binding var selectedBodyPart: BodyPart?
    @Binding var rotationAngle: Double
    @Binding var scale: CGFloat
    
    var body: some View {
        ZStack {
            // Model container
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.systemGray6))
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
            
            // 3D SceneKit Body View
            SceneKitBodyView(selectedBodyPart: $selectedBodyPart)
                .cornerRadius(24)
                .padding(4)
            
            // Instructions overlay
            VStack {
                Spacer()
                HStack(spacing: 20) {
                    instructionItem(icon: "hand.draw", text: "Drag to rotate")
                    instructionItem(icon: "magnifyingglass", text: "Pinch to zoom")
                    instructionItem(icon: "hand.tap", text: "Tap body parts")
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground).opacity(0.9))
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                )
                .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func instructionItem(icon: String, text: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.blue)
            Text(text)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

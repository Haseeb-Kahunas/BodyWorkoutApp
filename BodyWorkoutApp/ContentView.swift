import SwiftUI

// MARK: - Main App View
struct ContentView: View {
    @State private var selectedBodyPart: BodyPart?
    @State private var showingSelection = false
    @State private var showBodyPartsList = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    VStack(spacing: 8) {
                        Text("💪 Body Workout Guide")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                        
                        Text("Tap any body part to start")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    BodyModelView(
                        selectedBodyPart: $selectedBodyPart,
                        showingSelection: $showingSelection
                    )
                    
                    Button(action: {
                        showBodyPartsList = true
                    }) {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("View All Body Parts")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                    NavigationLink(
                        destination: Group {
                            if let bodyPart = selectedBodyPart {
                                BodyPartDetailView(bodyPart: bodyPart)
                            }
                        },
                        isActive: $showingSelection
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showBodyPartsList) {
                BodyPartsListSheet(
                    selectedBodyPart: $selectedBodyPart,
                    showingSelection: $showingSelection,
                    showBodyPartsList: $showBodyPartsList
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Body Part Detail View
struct BodyPartDetailView: View {
    let bodyPart: BodyPart
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [bodyPart.color.opacity(0.1), bodyPart.color.opacity(0.05)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(bodyPart.color.opacity(0.2))
                            .frame(width: 80, height: 80)
                        
                        Text(bodyPart.name.prefix(2))
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(bodyPart.color)
                    }
                    
                    Text(bodyPart.name)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text(bodyPart.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                Text("What would you like to do?")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                VStack(spacing: 20) {
                    NavigationLink(destination: ExerciseListView(bodyPart: bodyPart, exerciseType: .workout)) {
                        ExerciseTypeButtonView(type: .workout)
                    }
                    
                    NavigationLink(destination: ExerciseListView(bodyPart: bodyPart, exerciseType: .stretching)) {
                        ExerciseTypeButtonView(type: .stretching)
                    }
                    
                    NavigationLink(destination: ExerciseListView(bodyPart: bodyPart, exerciseType: .massage)) {
                        ExerciseTypeButtonView(type: .massage)
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(bodyPart.name)
    }
}

// MARK: - Exercise List View
struct ExerciseListView: View {
    let bodyPart: BodyPart
    let exerciseType: ExerciseType
    
    var exercises: [Exercise] {
        switch exerciseType {
        case .workout:
            return bodyPart.exercises
        case .stretching:
            return bodyPart.stretches
        case .massage:
            return bodyPart.massages
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(exerciseType.icon)
                                .font(.system(size: 40))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(exerciseType.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text(bodyPart.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(bodyPart.color.opacity(0.2))
                    .cornerRadius(15)
                    
                    VStack(spacing: 10) {
                        Text("3D Demonstration")
                            .font(.headline)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.1))
                                .frame(height: 200)
                            
                            VStack(spacing: 10) {
                                Text("🎭")
                                    .font(.system(size: 60))
                                
                                Text("3D Animation Coming Soon")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("📋 Instructions")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ForEach(exercises) { exercise in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(exercise.name)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Text(exercise.difficulty.rawValue)
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(exercise.difficulty.color.opacity(0.2))
                                        .foregroundColor(exercise.difficulty.color)
                                        .cornerRadius(8)
                                }
                                
                                Text(exercise.instructions)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Label(exercise.duration, systemImage: "clock")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 3)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(bodyPart.name)
    }
}

// MARK: - Exercise Type Button View
struct ExerciseTypeButtonView: View {
    let type: ExerciseType
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .fill(type.color.opacity(0.2))
                    .frame(width: 60, height: 60)
                
                Text(type.icon)
                    .font(.system(size: 30))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(type.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(type.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: type.color.opacity(0.2), radius: 5)
    }
}

// MARK: - Exercise Type Enum
enum ExerciseType {
    case workout
    case stretching
    case massage
    
    var icon: String {
        switch self {
        case .workout: return "💪"
        case .stretching: return "🧘"
        case .massage: return "✋"
        }
    }
    
    var title: String {
        switch self {
        case .workout: return "Workout Exercise"
        case .stretching: return "Stretching Exercise"
        case .massage: return "Massage Technique"
        }
    }
    
    var description: String {
        switch self {
        case .workout: return "Build strength and endurance"
        case .stretching: return "Improve flexibility and mobility"
        case .massage: return "Relieve tension and pain"
        }
    }
    
    var color: Color {
        switch self {
        case .workout: return .red
        case .stretching: return .green
        case .massage: return .blue
        }
    }
}

// MARK: - Body Parts List Sheet
struct BodyPartsListSheet: View {
    @Binding var selectedBodyPart: BodyPart?
    @Binding var showingSelection: Bool
    @Binding var showBodyPartsList: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section("🧠 Head & Neck") {
                    ForEach([BodyPart.head, .forehead, .eyes, .jaw, .ears, .neck]) { part in
                        Button(part.name) {
                            selectedBodyPart = part
                            showBodyPartsList = false
                            showingSelection = true
                        }
                    }
                }
                
                Section("💪 Upper Body") {
                    ForEach([BodyPart.leftShoulder, .rightShoulder, .chest, .upperBack, .lowerBack]) { part in
                        Button(part.name) {
                            selectedBodyPart = part
                            showBodyPartsList = false
                            showingSelection = true
                        }
                    }
                }
                
                Section("💪 Arms") {
                    ForEach([BodyPart.leftBicep, .rightBicep, .leftTricep, .rightTricep]) { part in
                        Button(part.name) {
                            selectedBodyPart = part
                            showBodyPartsList = false
                            showingSelection = true
                        }
                    }
                }
                
                Section("🔥 Core") {
                    ForEach([BodyPart.abs, .obliques, .hips]) { part in
                        Button(part.name) {
                            selectedBodyPart = part
                            showBodyPartsList = false
                            showingSelection = true
                        }
                    }
                }
                
                Section("🦵 Legs") {
                    ForEach([BodyPart.leftThigh, .rightThigh, .leftKnee, .rightKnee, .leftCalf, .rightCalf]) { part in
                        Button(part.name) {
                            selectedBodyPart = part
                            showBodyPartsList = false
                            showingSelection = true
                        }
                    }
                }
            }
            .navigationTitle("All Body Parts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

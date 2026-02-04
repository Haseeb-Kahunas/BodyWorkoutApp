//
//  Untitled.swift
//  BodyWorkoutApp
//
//  Created by Haseeb Ahmed on 29/01/2026.
//
import SwiftUI

// MARK: - Body Part Enum
enum BodyPart: String, CaseIterable, Identifiable {
    // Head region
    case head = "Head"
    case forehead = "Forehead"
    case eyes = "Eyes"
    case jaw = "Jaw"
    case ears = "Ears"
    case neck = "Neck"
    
    // Upper body
    case leftShoulder = "Left Shoulder"
    case rightShoulder = "Right Shoulder"
    case chest = "Chest"
    case upperBack = "Upper Back"
    case lowerBack = "Lower Back"
    
    // Arms
    case leftBicep = "Left Bicep"
    case rightBicep = "Right Bicep"
    case leftTricep = "Left Tricep"
    case rightTricep = "Right Tricep"
    case leftForearm = "Left Forearm"
    case rightForearm = "Right Forearm"
    case leftWrist = "Left Wrist"
    case rightWrist = "Right Wrist"
    
    // Hands
    case leftHand = "Left Hand"
    case rightHand = "Right Hand"
    case leftFingers = "Left Fingers"
    case rightFingers = "Right Fingers"
    
    // Core
    case abs = "Abs"
    case obliques = "Obliques"
    case hips = "Hips"
    
    // Legs
    case leftThigh = "Left Thigh"
    case rightThigh = "Right Thigh"
    case leftKnee = "Left Knee"
    case rightKnee = "Right Knee"
    case leftCalf = "Left Calf"
    case rightCalf = "Right Calf"
    case leftAnkle = "Left Ankle"
    case rightAnkle = "Right Ankle"
    
    // Feet
    case leftFoot = "Left Foot"
    case rightFoot = "Right Foot"
    
    var id: String { rawValue }
    var name: String { rawValue }
    
    var description: String {
        switch self {
        // Head region
        case .head:
            return "Overall head health and tension relief."
        case .forehead:
            return "Relieve tension headaches and forehead strain."
        case .eyes:
            return "Reduce eye strain and improve focus."
        case .jaw:
            return "Release jaw tension and TMJ discomfort."
        case .ears:
            return "Improve circulation and relieve ear pressure."
        case .neck:
            return "Reduce stiffness and improve neck mobility."
            
        // Upper body
        case .leftShoulder, .rightShoulder:
            return "Strengthen and stretch shoulder muscles for better posture."
        case .chest:
            return "Build upper body strength and improve breathing."
        case .upperBack:
            return "Strengthen upper back muscles and improve posture."
        case .lowerBack:
            return "Relieve lower back pain and strengthen core support."
            
        // Arms
        case .leftBicep, .rightBicep:
            return "Build arm strength and definition."
        case .leftTricep, .rightTricep:
            return "Strengthen the back of your arms."
        case .leftForearm, .rightForearm:
            return "Improve grip strength and forearm endurance."
        case .leftWrist, .rightWrist:
            return "Strengthen wrists and prevent strain."
            
        // Hands
        case .leftHand, .rightHand:
            return "Improve hand strength and dexterity."
        case .leftFingers, .rightFingers:
            return "Increase finger flexibility and strength."
            
        // Core
        case .abs:
            return "Strengthen your core for better stability and posture."
        case .obliques:
            return "Strengthen side muscles for core stability."
        case .hips:
            return "Improve hip mobility and flexibility."
            
        // Legs
        case .leftThigh, .rightThigh:
            return "Build leg strength and muscle endurance."
        case .leftKnee, .rightKnee:
            return "Strengthen knees and improve joint health."
        case .leftCalf, .rightCalf:
            return "Build calf strength and improve ankle stability."
        case .leftAnkle, .rightAnkle:
            return "Strengthen ankles and improve balance."
            
        // Feet
        case .leftFoot, .rightFoot:
            return "Improve foot strength and reduce pain."
        }
    }
    
    var color: Color {
        switch self {
        // Head - Purple tones
        case .head, .forehead, .eyes, .jaw, .ears:
            return .purple
        case .neck:
            return .blue
            
        // Upper body - Warm tones
        case .leftShoulder, .rightShoulder:
            return .orange
        case .chest:
            return .red
        case .upperBack, .lowerBack:
            return .brown
            
        // Arms - Blue tones
        case .leftBicep, .rightBicep, .leftTricep, .rightTricep:
            return .blue
        case .leftForearm, .rightForearm:
            return .cyan
        case .leftWrist, .rightWrist:
            return .teal
            
        // Hands - Pink tones
        case .leftHand, .rightHand, .leftFingers, .rightFingers:
            return .pink
            
        // Core - Green tones
        case .abs, .obliques:
            return .green
        case .hips:
            return .mint
            
        // Legs - Cool tones
        case .leftThigh, .rightThigh:
            return .indigo
        case .leftKnee, .rightKnee:
            return .purple
        case .leftCalf, .rightCalf:
            return .cyan
        case .leftAnkle, .rightAnkle:
            return .teal
            
        // Feet
        case .leftFoot, .rightFoot:
            return .gray
        }
    }
    
    var exercises: [Exercise] {
        switch self {
        // Head exercises
        case .head, .forehead:
            return [
                Exercise(name: "Neck Rotations", instructions: "Slowly rotate your head in circles. 10 rotations clockwise, then 10 counter-clockwise.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Forehead Massage", instructions: "Use fingertips to massage forehead in upward strokes.", duration: "3 min", difficulty: .easy)
            ]
        case .eyes:
            return [
                Exercise(name: "Eye Circles", instructions: "Look up, then slowly circle your eyes clockwise 10 times, then counter-clockwise 10 times.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Focus Shifts", instructions: "Focus on a near object, then a far object. Repeat 20 times.", duration: "3 min", difficulty: .easy)
            ]
        case .jaw:
            return [
                Exercise(name: "Jaw Stretches", instructions: "Open mouth wide, hold for 5 seconds. Close and repeat 10 times.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Jaw Massage", instructions: "Massage jaw muscles in circular motions.", duration: "3 min", difficulty: .easy)
            ]
        case .ears:
            return [
                Exercise(name: "Ear Massage", instructions: "Gently massage earlobes and outer ears in circular motions.", duration: "2 min", difficulty: .easy)
            ]
        case .neck:
            return [
                Exercise(name: "Neck Tilts", instructions: "Tilt head left, hold 10 seconds, then right. Repeat 5 times.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Chin Tucks", instructions: "Pull chin back towards neck. Hold 5 seconds. Repeat 10 times.", duration: "2 min", difficulty: .easy)
            ]
            
        // Upper body
        case .leftShoulder, .rightShoulder:
            return [
                Exercise(name: "Shoulder Rolls", instructions: "Roll shoulders backward in large circles. Do 15 repetitions.", duration: "3 min", difficulty: .easy),
                Exercise(name: "Arm Circles", instructions: "Extend arms out. Make circles. 20 forward, 20 backward.", duration: "4 min", difficulty: .medium)
            ]
        case .chest:
            return [
                Exercise(name: "Push-ups", instructions: "Standard push-up position. Lower and push up. 10-15 reps.", duration: "5 min", difficulty: .medium),
                Exercise(name: "Chest Stretch", instructions: "Stand in doorway, arms on frame. Lean forward. Hold 30 seconds.", duration: "2 min", difficulty: .easy)
            ]
        case .upperBack:
            return [
                Exercise(name: "Rows", instructions: "Pull elbows back, squeezing shoulder blades together. 15 reps.", duration: "5 min", difficulty: .medium),
                Exercise(name: "Cat-Cow Stretch", instructions: "On hands and knees, arch and round back. 10 reps.", duration: "3 min", difficulty: .easy)
            ]
        case .lowerBack:
            return [
                Exercise(name: "Lower Back Stretch", instructions: "Lie on back, pull knees to chest. Hold 30 seconds.", duration: "3 min", difficulty: .easy),
                Exercise(name: "Superman", instructions: "Lie on stomach, lift arms and legs. Hold 10 seconds. 10 reps.", duration: "5 min", difficulty: .medium)
            ]
            
        // Arms
        case .leftBicep, .rightBicep:
            return [
                Exercise(name: "Bicep Curls", instructions: "Curl weights toward shoulders. 12-15 reps.", duration: "5 min", difficulty: .medium),
                Exercise(name: "Hammer Curls", instructions: "Curl with palms facing each other. 12-15 reps.", duration: "5 min", difficulty: .medium)
            ]
        case .leftTricep, .rightTricep:
            return [
                Exercise(name: "Tricep Dips", instructions: "Lower body using chair or bench. 10-15 reps.", duration: "5 min", difficulty: .medium),
                Exercise(name: "Overhead Extensions", instructions: "Extend weight overhead. 12 reps.", duration: "4 min", difficulty: .medium)
            ]
        case .leftForearm, .rightForearm:
            return [
                Exercise(name: "Wrist Curls", instructions: "Curl wrists up and down with weight. 15 reps.", duration: "4 min", difficulty: .easy),
                Exercise(name: "Reverse Curls", instructions: "Curl with palms down. 12 reps.", duration: "4 min", difficulty: .medium)
            ]
        case .leftWrist, .rightWrist:
            return [
                Exercise(name: "Wrist Rotations", instructions: "Rotate wrists in circles. 10 each direction.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Wrist Flexion", instructions: "Flex wrist up and down. 15 reps.", duration: "3 min", difficulty: .easy)
            ]
            
        // Hands
        case .leftHand, .rightHand:
            return [
                Exercise(name: "Grip Squeezes", instructions: "Squeeze a ball or grip trainer. 15 reps.", duration: "3 min", difficulty: .easy),
                Exercise(name: "Hand Stretches", instructions: "Spread fingers wide, then make a fist. 10 reps.", duration: "2 min", difficulty: .easy)
            ]
        case .leftFingers, .rightFingers:
            return [
                Exercise(name: "Finger Taps", instructions: "Tap each finger to thumb rapidly. 20 seconds.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Finger Stretches", instructions: "Pull each finger back gently. Hold 10 seconds each.", duration: "3 min", difficulty: .easy)
            ]
            
        // Core
        case .abs:
            return [
                Exercise(name: "Crunches", instructions: "Lie on back, lift shoulders using abs. 15-20 reps.", duration: "5 min", difficulty: .medium),
                Exercise(name: "Plank", instructions: "Hold push-up position on forearms. Start with 30 seconds.", duration: "3 min", difficulty: .hard)
            ]
        case .obliques:
            return [
                Exercise(name: "Side Plank", instructions: "Hold side plank position. 30 seconds each side.", duration: "4 min", difficulty: .medium),
                Exercise(name: "Russian Twists", instructions: "Sit, lean back, rotate torso side to side. 20 reps.", duration: "5 min", difficulty: .medium)
            ]
        case .hips:
            return [
                Exercise(name: "Hip Circles", instructions: "Stand, rotate hips in circles. 10 each direction.", duration: "3 min", difficulty: .easy),
                Exercise(name: "Hip Flexor Stretch", instructions: "Lunge position, push hips forward. Hold 30 seconds.", duration: "3 min", difficulty: .easy)
            ]
            
        // Legs
        case .leftThigh, .rightThigh:
            return [
                Exercise(name: "Squats", instructions: "Lower down as if sitting. Return to standing. 15 reps.", duration: "5 min", difficulty: .medium),
                Exercise(name: "Lunges", instructions: "Step forward, lower hips to 90°. 10 reps each leg.", duration: "6 min", difficulty: .medium)
            ]
        case .leftKnee, .rightKnee:
            return [
                Exercise(name: "Knee Extensions", instructions: "Sit, extend leg straight. 15 reps.", duration: "4 min", difficulty: .easy),
                Exercise(name: "Wall Sits", instructions: "Sit against wall, knees at 90°. Hold 30 seconds.", duration: "3 min", difficulty: .medium)
            ]
        case .leftCalf, .rightCalf:
            return [
                Exercise(name: "Calf Raises", instructions: "Rise up on toes. Lower slowly. 20 reps.", duration: "4 min", difficulty: .easy),
                Exercise(name: "Calf Stretch", instructions: "Step forward, push back heel down. Hold 30 seconds.", duration: "2 min", difficulty: .easy)
            ]
        case .leftAnkle, .rightAnkle:
            return [
                Exercise(name: "Ankle Rotations", instructions: "Rotate ankle in circles. 10 each direction.", duration: "2 min", difficulty: .easy),
                Exercise(name: "Ankle Flexion", instructions: "Point and flex foot. 15 reps.", duration: "3 min", difficulty: .easy)
            ]
            
        // Feet
        case .leftFoot, .rightFoot:
            return [
                Exercise(name: "Toe Curls", instructions: "Curl toes, then spread them. 15 reps.", duration: "3 min", difficulty: .easy),
                Exercise(name: "Foot Rolls", instructions: "Roll foot over ball. 2 minutes each foot.", duration: "5 min", difficulty: .easy)
            ]
        }
    }
    
    var stretches: [Exercise] {
        return [
            Exercise(name: "Static Stretch", instructions: "Hold the stretch position for 30-60 seconds without bouncing.", duration: "1-2 min", difficulty: .easy),
            Exercise(name: "Dynamic Stretch", instructions: "Move through full range of motion 10-15 times.", duration: "2-3 min", difficulty: .easy)
        ]
    }
    
    var massages: [Exercise] {
        return [
            Exercise(name: "Self-Massage", instructions: "Use hands or massage ball to apply gentle pressure in circular motions.", duration: "5 min", difficulty: .easy),
            Exercise(name: "Foam Rolling", instructions: "Roll affected area slowly. Pause on tight spots for 20-30 seconds.", duration: "5-10 min", difficulty: .easy)
        ]
    }
}

// MARK: - Exercise Model
struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let instructions: String
    let duration: String
    let difficulty: DifficultyLevel
}

// MARK: - Difficulty Level
enum DifficultyLevel: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var color: Color {
        switch self {
        case .easy:
            return .green
        case .medium:
            return .orange
        case .hard:
            return .red
        }
    }
}

import SwiftUI

enum BodyPart: String, CaseIterable, Identifiable {
    case head, forehead, eyes, jaw, ears
    case neck
    case leftShoulder, rightShoulder
    case chest
    case upperBack, lowerBack
    case leftBicep, rightBicep
    case leftTricep, rightTricep
    case leftForearm, rightForearm
    case leftWrist, rightWrist
    case leftHand, rightHand
    case leftFingers, rightFingers
    case abs, obliques
    case hips
    case leftThigh, rightThigh
    case leftKnee, rightKnee
    case leftCalf, rightCalf
    case leftAnkle, rightAnkle
    case leftFoot, rightFoot
    
    var id: String { rawValue }
    
    var name: String {
        switch self {
        case .head: return "Head"
        case .forehead: return "Forehead"
        case .eyes: return "Eyes"
        case .jaw: return "Jaw"
        case .ears: return "Ears"
        case .neck: return "Neck"
        case .leftShoulder: return "Left Shoulder"
        case .rightShoulder: return "Right Shoulder"
        case .chest: return "Chest"
        case .upperBack: return "Upper Back"
        case .lowerBack: return "Lower Back"
        case .leftBicep: return "Left Bicep"
        case .rightBicep: return "Right Bicep"
        case .leftTricep: return "Left Tricep"
        case .rightTricep: return "Right Tricep"
        case .leftForearm: return "Left Forearm"
        case .rightForearm: return "Right Forearm"
        case .leftWrist: return "Left Wrist"
        case .rightWrist: return "Right Wrist"
        case .leftHand: return "Left Hand"
        case .rightHand: return "Right Hand"
        case .leftFingers: return "Left Fingers"
        case .rightFingers: return "Right Fingers"
        case .abs: return "Abs"
        case .obliques: return "Obliques"
        case .hips: return "Hips"
        case .leftThigh: return "Left Thigh"
        case .rightThigh: return "Right Thigh"
        case .leftKnee: return "Left Knee"
        case .rightKnee: return "Right Knee"
        case .leftCalf: return "Left Calf"
        case .rightCalf: return "Right Calf"
        case .leftAnkle: return "Left Ankle"
        case .rightAnkle: return "Right Ankle"
        case .leftFoot: return "Left Foot"
        case .rightFoot: return "Right Foot"
        }
    }
    
    var color: Color {
        switch self {
        case .head, .forehead, .eyes, .jaw, .ears: return .pink
        case .neck: return .orange
        case .leftShoulder, .rightShoulder: return .yellow
        case .chest: return .blue
        case .upperBack, .lowerBack: return .brown
        case .leftBicep, .rightBicep, .leftTricep, .rightTricep: return .teal
        case .leftForearm, .rightForearm: return .cyan
        case .leftWrist, .rightWrist: return .teal
        case .leftHand, .rightHand, .leftFingers, .rightFingers: return .pink
        case .abs, .obliques: return .green
        case .hips: return .mint
        case .leftThigh, .rightThigh: return .indigo
        case .leftKnee, .rightKnee: return .indigo
        case .leftCalf, .rightCalf: return .cyan
        case .leftAnkle, .rightAnkle: return .teal
        case .leftFoot, .rightFoot: return .gray
        }
    }
    
    var icon: String {
        switch self {
        case .head, .forehead, .eyes, .jaw, .ears: return "brain.head.profile"
        case .neck: return "figure.stand"
        case .leftShoulder, .rightShoulder: return "figure.arms.open"
        case .chest: return "heart.fill"
        case .upperBack, .lowerBack: return "figure.stand"
        case .leftBicep, .rightBicep, .leftTricep, .rightTricep: return "figure.strengthtraining.traditional"
        case .leftForearm, .rightForearm, .leftWrist, .rightWrist: return "hand.raised.fill"
        case .leftHand, .rightHand, .leftFingers, .rightFingers: return "hand.point.up.left.fill"
        case .abs, .obliques: return "figure.core.training"
        case .hips: return "figure.flexibility"
        case .leftThigh, .rightThigh: return "figure.walk"
        case .leftKnee, .rightKnee: return "figure.walk"
        case .leftCalf, .rightCalf: return "figure.run"
        case .leftAnkle, .rightAnkle, .leftFoot, .rightFoot: return "figure.run"
        }
    }
    
    var category: String {
        switch self {
        case .head, .forehead, .eyes, .jaw, .ears, .neck: return "Upper Body"
        case .leftShoulder, .rightShoulder, .chest, .upperBack, .lowerBack: return "Torso"
        case .leftBicep, .rightBicep, .leftTricep, .rightTricep, .leftForearm, .rightForearm, .leftWrist, .rightWrist, .leftHand, .rightHand, .leftFingers, .rightFingers: return "Arms"
        case .abs, .obliques, .hips: return "Core"
        case .leftThigh, .rightThigh, .leftKnee, .rightKnee, .leftCalf, .rightCalf, .leftAnkle, .rightAnkle, .leftFoot, .rightFoot: return "Legs"
        }
    }
    
    var description: String {
        switch self {
        case .head: return "Target the muscles of the head and face"
        case .forehead: return "Relax tension in the forehead area"
        case .eyes: return "Reduce eye strain and fatigue"
        case .jaw: return "Release jaw tension and tightness"
        case .ears: return "Improve circulation around the ears"
        case .neck: return "Strengthen and stretch neck muscles"
        case .leftShoulder, .rightShoulder: return "Build strong, defined shoulders"
        case .chest: return "Develop a powerful chest"
        case .upperBack: return "Strengthen upper back muscles"
        case .lowerBack: return "Support and stabilize lower back"
        case .leftBicep, .rightBicep: return "Build bigger, stronger biceps"
        case .leftTricep, .rightTricep: return "Develop defined triceps"
        case .leftForearm, .rightForearm: return "Strengthen grip and forearm muscles"
        case .leftWrist, .rightWrist: return "Improve wrist stability and flexibility"
        case .leftHand, .rightHand: return "Enhance hand strength and dexterity"
        case .leftFingers, .rightFingers: return "Improve finger flexibility and strength"
        case .abs: return "Build a strong, defined core"
        case .obliques: return "Develop side ab definition"
        case .hips: return "Increase hip mobility and strength"
        case .leftThigh, .rightThigh: return "Build powerful leg muscles"
        case .leftKnee, .rightKnee: return "Strengthen muscles around the knee"
        case .leftCalf, .rightCalf: return "Develop strong, defined calves"
        case .leftAnkle, .rightAnkle: return "Improve ankle stability"
        case .leftFoot, .rightFoot: return "Strengthen foot muscles"
        }
    }
    
    var exercises: [String] {
        switch self {
        case .head, .forehead, .eyes, .jaw, .ears:
            return ["Face Massage", "Jaw Stretches", "Eye Exercises"]
        case .neck:
            return ["Neck Rolls", "Chin Tucks", "Side Neck Stretch"]
        case .leftShoulder, .rightShoulder:
            return ["Shoulder Press", "Lateral Raises", "Front Raises", "Shoulder Shrugs"]
        case .chest:
            return ["Push-ups", "Bench Press", "Chest Flyes", "Dips"]
        case .upperBack:
            return ["Pull-ups", "Rows", "Face Pulls", "Reverse Flyes"]
        case .lowerBack:
            return ["Deadlifts", "Hyperextensions", "Superman", "Bird Dog"]
        case .leftBicep, .rightBicep:
            return ["Bicep Curls", "Hammer Curls", "Chin-ups", "Concentration Curls"]
        case .leftTricep, .rightTricep:
            return ["Tricep Dips", "Overhead Extension", "Close-Grip Press", "Kickbacks"]
        case .leftForearm, .rightForearm:
            return ["Wrist Curls", "Reverse Curls", "Farmer's Walk", "Grip Squeeze"]
        case .leftWrist, .rightWrist:
            return ["Wrist Rotations", "Wrist Flexion", "Wrist Extension"]
        case .leftHand, .rightHand, .leftFingers, .rightFingers:
            return ["Finger Stretches", "Grip Strengthening", "Finger Taps"]
        case .abs:
            return ["Crunches", "Planks", "Leg Raises", "Mountain Climbers"]
        case .obliques:
            return ["Side Planks", "Russian Twists", "Bicycle Crunches", "Woodchoppers"]
        case .hips:
            return ["Hip Thrusts", "Fire Hydrants", "Hip Circles", "Glute Bridges"]
        case .leftThigh, .rightThigh:
            return ["Squats", "Lunges", "Leg Press", "Step-ups"]
        case .leftKnee, .rightKnee:
            return ["Wall Sits", "Leg Extensions", "Terminal Knee Extension"]
        case .leftCalf, .rightCalf:
            return ["Calf Raises", "Jump Rope", "Box Jumps", "Seated Calf Raise"]
        case .leftAnkle, .rightAnkle:
            return ["Ankle Circles", "Calf Stretch", "Ankle Alphabet"]
        case .leftFoot, .rightFoot:
            return ["Toe Curls", "Foot Arch Lift", "Toe Spreads"]
        }
    }
}

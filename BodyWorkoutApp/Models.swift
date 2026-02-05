import SwiftUI

// MARK: - Body Part Enum
enum BodyPart: String, CaseIterable, Identifiable {
    case head, forehead, eyes, jaw, ears, neck
    case leftShoulder, rightShoulder
    case chest, upperBack, lowerBack
    case leftBicep, rightBicep, leftTricep, rightTricep
    case leftForearm, rightForearm, leftWrist, rightWrist
    case leftHand, rightHand, leftFingers, rightFingers
    case abs, obliques, hips
    case leftThigh, rightThigh, leftKnee, rightKnee
    case leftCalf, rightCalf, leftAnkle, rightAnkle
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
    
    var description: String {
        switch self {
        case .head: return "Cranium and skull - protects the brain"
        case .forehead: return "Front part of the head above the eyes"
        case .eyes: return "Organs of sight"
        case .jaw: return "Mandible - lower part of the face"
        case .ears: return "Organs of hearing and balance"
        case .neck: return "Connects head to torso, supports head movement"
        case .leftShoulder, .rightShoulder: return "Ball and socket joint connecting arm to torso"
        case .chest: return "Pectoral muscles - push, lift, and stabilize upper body"
        case .upperBack: return "Trapezius and rhomboids - posture and shoulder movement"
        case .lowerBack: return "Lumbar region - supports spine and core stability"
        case .leftBicep, .rightBicep: return "Front arm muscle - flexes elbow and rotates forearm"
        case .leftTricep, .rightTricep: return "Back arm muscle - extends elbow"
        case .leftForearm, .rightForearm: return "Lower arm muscles - wrist and finger movement"
        case .leftWrist, .rightWrist: return "Joint connecting hand to forearm"
        case .leftHand, .rightHand: return "Complex structure for gripping and manipulation"
        case .leftFingers, .rightFingers: return "Digits used for fine motor control"
        case .abs: return "Rectus abdominis - core stability and flexion"
        case .obliques: return "Side core muscles - rotation and lateral flexion"
        case .hips: return "Hip flexors and glutes - leg movement and stability"
        case .leftThigh, .rightThigh: return "Quadriceps and hamstrings - knee extension and flexion"
        case .leftKnee, .rightKnee: return "Largest joint - connects thigh to lower leg"
        case .leftCalf, .rightCalf: return "Gastrocnemius and soleus - ankle movement"
        case .leftAnkle, .rightAnkle: return "Joint connecting foot to leg"
        case .leftFoot, .rightFoot: return "Foundation for standing and walking"
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
    
    var exercises: [Exercise] {
        switch self {
        // HEAD & FACE
        case .head:
            return [
                Exercise(name: "Neck Nods", instructions: "Slowly nod your head forward and back. Keep movement controlled. Strengthens neck muscles supporting the head.", duration: "2 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Head Rotations", instructions: "Gently rotate head in circles. Go clockwise then counterclockwise. Improves neck mobility.", duration: "10 circles each direction", difficulty: .easy),
                Exercise(name: "Resistance Head Push", instructions: "Place hand on forehead. Push head forward against resistance. Hold for 5 seconds. Builds neck strength.", duration: "3 sets of 10 reps", difficulty: .medium),
                Exercise(name: "Scalp Tension Release", instructions: "Use fingertips to gently massage scalp in circular motions. Cover entire head. Relieves tension headaches.", duration: "5 minutes", difficulty: .easy)
            ]
            
        case .forehead:
            return [
                Exercise(name: "Eyebrow Lifts", instructions: "Raise eyebrows as high as possible. Hold for 5 seconds. Release. Strengthens forehead muscles.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Forehead Smoothing", instructions: "Place fingers on forehead. Gently push up while trying to frown. Creates resistance. Reduces forehead lines.", duration: "2 sets of 15 reps", difficulty: .easy)
            ]
            
        case .eyes:
            return [
                Exercise(name: "Eye Circles", instructions: "Move eyes in full circles without moving head. Go slowly. Strengthens eye muscles and improves mobility.", duration: "10 circles each direction", difficulty: .easy),
                Exercise(name: "Focus Shifts", instructions: "Hold finger close to face. Focus on it, then shift focus to distant object. Repeat. Improves eye flexibility.", duration: "3 sets of 10 shifts", difficulty: .easy),
                Exercise(name: "Palming", instructions: "Rub hands together, cup over closed eyes without touching. Feel warmth. Relaxes eye muscles.", duration: "3 minutes", difficulty: .easy),
                Exercise(name: "Eye Squeeze", instructions: "Close eyes tightly for 3 seconds. Open wide. Repeat. Strengthens eyelid muscles.", duration: "3 sets of 10 reps", difficulty: .easy)
            ]
            
        case .jaw:
            return [
                Exercise(name: "Jaw Opening", instructions: "Slowly open mouth as wide as comfortable. Hold 5 seconds. Close slowly. Increases jaw mobility.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Jaw Side to Side", instructions: "Move jaw from side to side slowly. Feel the stretch. Loosens tight jaw muscles.", duration: "2 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Resistance Jaw Close", instructions: "Place fist under chin. Try to close mouth while providing gentle resistance. Strengthens jaw.", duration: "3 sets of 10 holds (5 sec each)", difficulty: .medium),
                Exercise(name: "TMJ Massage", instructions: "Use fingertips to massage jaw joint in front of ears. Use circular motions. Relieves jaw tension.", duration: "5 minutes per side", difficulty: .easy)
            ]
            
        case .ears:
            return [
                Exercise(name: "Ear Pulls", instructions: "Gently pull earlobes down, sides out, and tops up. Hold each for 5 seconds. Promotes circulation.", duration: "3 sets of 5 reps", difficulty: .easy),
                Exercise(name: "Ear Massage", instructions: "Massage entire ear with circular motions. Include behind ears. Relieves tension and improves blood flow.", duration: "3-5 minutes per ear", difficulty: .easy)
            ]
            
        case .neck:
            return [
                Exercise(name: "Neck Tilts", instructions: "Tilt head toward shoulder, hold 10 seconds. Return to center. Alternate sides. Stretches neck muscles.", duration: "3 sets of 5 reps each side", difficulty: .easy),
                Exercise(name: "Neck Rotations", instructions: "Slowly turn head to look over shoulder. Hold 10 seconds. Alternate sides. Improves neck mobility.", duration: "3 sets of 5 reps each side", difficulty: .easy),
                Exercise(name: "Chin Tucks", instructions: "Pull chin straight back creating double chin. Hold 5 seconds. Strengthens deep neck muscles, improves posture.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Neck Isometrics", instructions: "Place hand on side of head. Push head against hand without moving. Hold 10 seconds. Builds neck strength.", duration: "3 sets of 5 reps each side", difficulty: .medium),
                Exercise(name: "Neck Circles", instructions: "Roll head in full circles slowly. Change direction. Loosens tight neck muscles. Be gentle.", duration: "5 circles each direction", difficulty: .easy)
            ]
            
        // SHOULDERS
        case .leftShoulder, .rightShoulder:
            return [
                Exercise(name: "Shoulder Rolls", instructions: "Roll shoulders backward in large circles. Then roll forward. Loosens shoulder joints and improves mobility.", duration: "3 sets of 15 reps each direction", difficulty: .easy),
                Exercise(name: "Arm Circles", instructions: "Extend arms to sides. Make small circles, gradually increasing size. Reverse direction. Warms up shoulder joint.", duration: "2 sets of 20 circles each direction", difficulty: .easy),
                Exercise(name: "Wall Push-ups (Shoulder Focus)", instructions: "Stand facing wall, hands on wall at shoulder height. Lean in and push back. Emphasize shoulder engagement.", duration: "3 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Pike Push-ups", instructions: "Start in downward dog position. Bend elbows to lower head toward ground. Push back up. Targets shoulders.", duration: "3 sets of 10-12 reps", difficulty: .medium),
                Exercise(name: "Shoulder Taps", instructions: "In plank position, tap opposite shoulder with each hand alternately. Maintain stable core. Builds shoulder stability.", duration: "3 sets of 20 taps (10 each side)", difficulty: .medium),
                Exercise(name: "Handstand Hold (Wall Supported)", instructions: "Kick up to handstand against wall. Hold position. Advanced shoulder strength exercise. Start with shorter holds.", duration: "3 sets of 10-30 seconds", difficulty: .hard),
                Exercise(name: "Pseudo Planche Lean", instructions: "In plank, lean forward so shoulders pass over hands. Hold. Advanced shoulder strengthener.", duration: "3 sets of 10-20 second holds", difficulty: .hard)
            ]
            
        // CHEST
        case .chest:
            return [
                Exercise(name: "Push-ups", instructions: "Start in plank position. Lower body until chest nearly touches floor. Push back up. Keep core tight and back straight throughout.", duration: "3 sets of 10-15 reps", difficulty: .easy),
                Exercise(name: "Incline Push-ups", instructions: "Place hands on elevated surface (bench, table). Perform push-ups. Easier variation for beginners. Focus on controlled movement.", duration: "3 sets of 12-15 reps", difficulty: .easy),
                Exercise(name: "Diamond Push-ups", instructions: "Form diamond shape with hands under chest. Lower body while keeping elbows close. Targets inner chest and triceps.", duration: "3 sets of 8-12 reps", difficulty: .medium),
                Exercise(name: "Decline Push-ups", instructions: "Elevate feet on bench or step. Perform push-ups. Increases difficulty and targets upper chest.", duration: "3 sets of 10-12 reps", difficulty: .medium),
                Exercise(name: "Wide-Grip Push-ups", instructions: "Place hands wider than shoulder-width. Lower chest to ground. Emphasizes outer chest muscles. Keep core engaged.", duration: "3 sets of 10-15 reps", difficulty: .medium),
                Exercise(name: "Plyometric Push-ups", instructions: "Explosive push-up where hands leave ground. Clap at top if able. Builds power and strength. Land softly.", duration: "3 sets of 6-10 reps", difficulty: .hard),
                Exercise(name: "Archer Push-ups", instructions: "Start wide. As you lower, shift weight to one side, straightening other arm. Alternate sides. Advanced movement.", duration: "3 sets of 6-8 reps per side", difficulty: .hard)
            ]
            
        // BACK
        case .upperBack:
            return [
                Exercise(name: "Superman Holds", instructions: "Lie face down. Lift arms and legs off ground simultaneously. Hold. Strengthens entire back chain.", duration: "3 sets of 20-30 second holds", difficulty: .easy),
                Exercise(name: "Reverse Snow Angels", instructions: "Lie face down. Move arms from sides overhead and back, keeping them off ground. Activates upper back muscles.", duration: "3 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Wall Angels", instructions: "Stand with back against wall. Slide arms up and down wall in 'Y' to 'W' pattern. Improves posture and back strength.", duration: "3 sets of 12 reps", difficulty: .easy),
                Exercise(name: "Door Frame Rows", instructions: "Hold door frame, lean back with straight arms. Pull yourself toward frame. Mimics rowing motion.", duration: "3 sets of 10-15 reps", difficulty: .medium),
                Exercise(name: "Inverted Rows", instructions: "Use sturdy table or bar. Lie underneath, pull chest to bar. Keep body straight. Excellent back builder.", duration: "3 sets of 8-12 reps", difficulty: .medium),
                Exercise(name: "Band Pull-Aparts", instructions: "Hold resistance band with arms extended. Pull band apart by moving arms to sides. Strengthens rear deltoids and upper back.", duration: "3 sets of 15-20 reps", difficulty: .medium)
            ]
            
        case .lowerBack:
            return [
                Exercise(name: "Cat-Cow Stretch", instructions: "On hands and knees, alternate between arching back (cow) and rounding it (cat). Improves spine flexibility.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Bird Dogs", instructions: "On hands and knees, extend opposite arm and leg. Hold. Alternate sides. Builds core and lower back stability.", duration: "3 sets of 10 reps per side", difficulty: .easy),
                Exercise(name: "Bridge", instructions: "Lie on back, knees bent. Lift hips off ground to form straight line. Hold. Strengthens glutes and lower back.", duration: "3 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Back Extensions", instructions: "Lie face down. Place hands behind head. Lift upper body off ground using back muscles. Lower with control.", duration: "3 sets of 12-15 reps", difficulty: .medium),
                Exercise(name: "Good Mornings", instructions: "Stand with hands behind head. Hinge at hips, keeping back straight. Return to standing. Works hamstrings and lower back.", duration: "3 sets of 12 reps", difficulty: .medium)
            ]
            
        // ARMS
        case .leftBicep, .rightBicep:
            return [
                Exercise(name: "Wall Bicep Curls", instructions: "Stand with back against wall. Press arms against wall and curl forearms up. Creates isometric tension.", duration: "3 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Doorway Bicep Curls", instructions: "Stand in doorway. Grab frame with underhand grip. Pull yourself toward frame using biceps.", duration: "3 sets of 10-12 reps", difficulty: .medium),
                Exercise(name: "Chin-ups", instructions: "Hang from bar with underhand grip. Pull yourself up until chin clears bar. Lower with control. Excellent bicep builder.", duration: "3 sets of 5-10 reps", difficulty: .medium),
                Exercise(name: "Negative Chin-ups", instructions: "Jump to top position of chin-up. Lower yourself as slowly as possible. Builds strength for full chin-ups.", duration: "3 sets of 5 reps", difficulty: .medium),
                Exercise(name: "Isometric Bicep Hold", instructions: "Hold arms at 90 degrees with fists clenched. Flex biceps hard. Hold position. Builds peak strength.", duration: "3 sets of 30-60 second holds", difficulty: .medium)
            ]
            
        case .leftTricep, .rightTricep:
            return [
                Exercise(name: "Bench Dips", instructions: "Hands on bench behind you, feet extended. Lower body by bending elbows. Push back up. Targets triceps.", duration: "3 sets of 12-15 reps", difficulty: .easy),
                Exercise(name: "Diamond Push-ups", instructions: "Hands form diamond under chest. Lower body keeping elbows close. Emphasizes triceps. Push back up.", duration: "3 sets of 8-12 reps", difficulty: .medium),
                Exercise(name: "Close-Grip Push-ups", instructions: "Hands shoulder-width or closer. Lower body keeping elbows tucked. Focuses on triceps more than chest.", duration: "3 sets of 10-15 reps", difficulty: .medium),
                Exercise(name: "Pike Tricep Extensions", instructions: "Start in pike position. Bend elbows to lower head toward ground, keeping upper arms still. Extend back up.", duration: "3 sets of 10-12 reps", difficulty: .medium),
                Exercise(name: "Overhead Arm Extensions", instructions: "Stand, arms overhead. Lower forearms behind head by bending elbows. Extend back up. Stretches and strengthens triceps.", duration: "3 sets of 15 reps", difficulty: .easy)
            ]
            
        case .leftForearm, .rightForearm:
            return [
                Exercise(name: "Wrist Curls", instructions: "Rest forearm on surface, hand hanging off edge. Curl wrist up and down. Builds forearm flexors.", duration: "3 sets of 15-20 reps", difficulty: .easy),
                Exercise(name: "Reverse Wrist Curls", instructions: "Same position but palm down. Curl wrist up. Strengthens forearm extensors and prevents imbalances.", duration: "3 sets of 15-20 reps", difficulty: .easy),
                Exercise(name: "Finger Walks", instructions: "Place hand flat on table. Lift and move each finger independently. Improves dexterity and forearm control.", duration: "2 sets of 10 reps per finger", difficulty: .easy),
                Exercise(name: "Grip Squeezes", instructions: "Make tight fist, squeeze as hard as possible. Hold. Release slowly. Builds crushing grip strength.", duration: "3 sets of 10 reps (5 second holds)", difficulty: .medium),
                Exercise(name: "Dead Hangs", instructions: "Hang from pull-up bar with just grip strength. Hold as long as possible. Excellent forearm endurance builder.", duration: "3 sets of 20-60 seconds", difficulty: .medium)
            ]
            
        case .leftWrist, .rightWrist:
            return [
                Exercise(name: "Wrist Rotations", instructions: "Extend arm, make fist. Rotate wrist in circles. Change direction. Improves wrist mobility.", duration: "10 circles each direction, both wrists", difficulty: .easy),
                Exercise(name: "Prayer Stretch", instructions: "Press palms together in front of chest. Lower hands toward waist keeping palms together. Stretches wrist flexors.", duration: "3 sets of 30 second holds", difficulty: .easy),
                Exercise(name: "Reverse Prayer Stretch", instructions: "Press backs of hands together. Raise toward chest. Stretches wrist extensors.", duration: "3 sets of 30 second holds", difficulty: .easy),
                Exercise(name: "Wrist Flexion/Extension", instructions: "Support forearm, let hand hang. Move hand up and down through full range. Strengthens wrist muscles.", duration: "3 sets of 15 reps each direction", difficulty: .easy)
            ]
            
        // HANDS & FINGERS
        case .leftHand, .rightHand:
            return [
                Exercise(name: "Finger Taps", instructions: "Tap each finger to thumb in sequence. Go forward and backward. Improves finger coordination.", duration: "3 sets of 10 sequences", difficulty: .easy),
                Exercise(name: "Hand Squeezes", instructions: "Squeeze stress ball or similar object. Hold 5 seconds. Release. Builds hand strength.", duration: "3 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Finger Spreads", instructions: "Spread fingers wide apart. Hold 5 seconds. Bring together. Strengthens small hand muscles.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Hand Massage", instructions: "Massage palm with opposite thumb using circular motions. Work entire palm and base of fingers.", duration: "3-5 minutes per hand", difficulty: .easy)
            ]
            
        case .leftFingers, .rightFingers:
            return [
                Exercise(name: "Finger Extensions", instructions: "Place rubber band around fingers. Spread fingers apart against resistance. Strengthens finger extensors.", duration: "3 sets of 15 reps", difficulty: .easy),
                Exercise(name: "Finger Lifts", instructions: "Place hand flat on table. Lift each finger individually while keeping others down. Improves finger independence.", duration: "2 sets of 10 reps per finger", difficulty: .medium),
                Exercise(name: "Thumb Touches", instructions: "Touch thumb to tip of each finger. Then touch base of each finger. Improves thumb mobility and coordination.", duration: "3 sets of 10 sequences", difficulty: .easy)
            ]
            
        // CORE
        case .abs:
            return [
                Exercise(name: "Crunches", instructions: "Lie on back, knees bent. Lift shoulders off ground using abs. Lower with control. Don't pull on neck.", duration: "3 sets of 15-20 reps", difficulty: .easy),
                Exercise(name: "Bicycle Crunches", instructions: "Lie on back. Bring opposite elbow to opposite knee in pedaling motion. Targets entire core.", duration: "3 sets of 20 reps (10 each side)", difficulty: .easy),
                Exercise(name: "Plank", instructions: "Forearms on ground, body straight line. Hold position. Engage entire core. Don't let hips sag.", duration: "3 sets of 30-60 seconds", difficulty: .medium),
                Exercise(name: "Leg Raises", instructions: "Lie on back. Keep legs straight, lift to 90 degrees. Lower slowly without touching ground. Targets lower abs.", duration: "3 sets of 12-15 reps", difficulty: .medium),
                Exercise(name: "Mountain Climbers", instructions: "Start in plank. Drive knees to chest alternately in running motion. Keep core tight. Cardio and abs.", duration: "3 sets of 30 seconds", difficulty: .medium),
                Exercise(name: "V-Ups", instructions: "Lie flat. Simultaneously lift legs and upper body, forming V shape. Touch hands to feet. Lower with control.", duration: "3 sets of 10-15 reps", difficulty: .hard),
                Exercise(name: "Dragon Flags", instructions: "Lie on bench holding behind head. Raise entire body keeping it straight. Lower slowly. Advanced core exercise.", duration: "3 sets of 5-8 reps", difficulty: .hard)
            ]
            
        case .obliques:
            return [
                Exercise(name: "Side Plank", instructions: "Balance on one forearm and side of foot. Keep body straight. Hold. Strengthens lateral core muscles.", duration: "3 sets of 30 seconds each side", difficulty: .medium),
                Exercise(name: "Russian Twists", instructions: "Sit with feet elevated. Twist torso side to side, touching ground beside hips. Lean back for more challenge.", duration: "3 sets of 20 reps (10 each side)", difficulty: .medium),
                Exercise(name: "Windshield Wipers", instructions: "Hang from bar. Bring legs up, rotate side to side like windshield wipers. Advanced oblique exercise.", duration: "3 sets of 10 reps", difficulty: .hard),
                Exercise(name: "Side Bends", instructions: "Stand tall. Bend to one side, sliding hand down leg. Return to center. Alternate sides. Stretches and strengthens obliques.", duration: "3 sets of 15 reps each side", difficulty: .easy)
            ]
            
        case .hips:
            return [
                Exercise(name: "Hip Circles", instructions: "Stand on one leg. Make circles with raised leg. Change direction. Improves hip mobility.", duration: "10 circles each direction, both legs", difficulty: .easy),
                Exercise(name: "Fire Hydrants", instructions: "On hands and knees. Lift one leg to side keeping knee bent. Lower. Strengthens hip abductors.", duration: "3 sets of 15 reps each side", difficulty: .easy),
                Exercise(name: "Clamshells", instructions: "Lie on side, knees bent. Keep feet together, lift top knee. Lower. Strengthens hip rotators and glutes.", duration: "3 sets of 20 reps each side", difficulty: .easy),
                Exercise(name: "Hip Thrusts", instructions: "Upper back on bench, feet flat. Drive hips up to form straight line. Lower. Excellent glute and hip exercise.", duration: "3 sets of 15 reps", difficulty: .medium),
                Exercise(name: "Single-Leg Bridge", instructions: "Lie on back. One leg extended, other bent. Lift hips using bent leg. Challenges hip stability and strength.", duration: "3 sets of 12 reps each leg", difficulty: .medium)
            ]
            
        // LEGS
        case .leftThigh, .rightThigh:
            return [
                Exercise(name: "Squats", instructions: "Feet shoulder-width apart. Lower hips back and down like sitting in chair. Push through heels to stand. Fundamental leg exercise.", duration: "3 sets of 15-20 reps", difficulty: .easy),
                Exercise(name: "Lunges", instructions: "Step forward, lower back knee toward ground. Front knee over ankle. Push back to start. Alternate legs.", duration: "3 sets of 12 reps each leg", difficulty: .easy),
                Exercise(name: "Wall Sit", instructions: "Back against wall, slide down until thighs parallel to ground. Hold position. Builds quad endurance.", duration: "3 sets of 30-60 seconds", difficulty: .medium),
                Exercise(name: "Bulgarian Split Squats", instructions: "Back foot elevated on bench. Lower front leg into lunge position. Push back up. Excellent single-leg strength builder.", duration: "3 sets of 10-12 reps each leg", difficulty: .medium),
                Exercise(name: "Jump Squats", instructions: "Perform squat. Explosively jump from bottom position. Land softly, immediately go into next rep. Builds power.", duration: "3 sets of 10-15 reps", difficulty: .medium),
                Exercise(name: "Pistol Squats", instructions: "Stand on one leg. Lower into squat while extending other leg forward. Push back up. Advanced single-leg exercise.", duration: "3 sets of 5-8 reps each leg", difficulty: .hard)
            ]
            
        case .leftKnee, .rightKnee:
            return [
                Exercise(name: "Knee Circles", instructions: "Stand, place hands on knees. Make circles with knees. Change direction. Lubricates knee joints.", duration: "10 circles each direction", difficulty: .easy),
                Exercise(name: "Partial Squats", instructions: "Shallow squats, only going down 1/4 or 1/2 way. Strengthens muscles around knee without excessive stress.", duration: "3 sets of 20 reps", difficulty: .easy),
                Exercise(name: "Step-Ups", instructions: "Step up onto platform leading with one leg. Step down with control. Alternate legs. Functional knee strengthening.", duration: "3 sets of 12 reps each leg", difficulty: .medium),
                Exercise(name: "Terminal Knee Extensions", instructions: "Place resistance band behind knee. Stand, straighten knee fully against resistance. Builds quad strength near knee.", duration: "3 sets of 15 reps each leg", difficulty: .medium)
            ]
            
        case .leftCalf, .rightCalf:
            return [
                Exercise(name: "Calf Raises", instructions: "Stand on balls of feet. Raise heels as high as possible. Lower with control. Can be done on step for greater range.", duration: "3 sets of 20 reps", difficulty: .easy),
                Exercise(name: "Single-Leg Calf Raises", instructions: "Same as calf raises but on one leg. More challenging, builds unilateral strength and balance.", duration: "3 sets of 15 reps each leg", difficulty: .medium),
                Exercise(name: "Seated Calf Raises", instructions: "Sit with feet flat. Raise heels off ground. Targets soleus muscle. Can add weight on knees.", duration: "3 sets of 20 reps", difficulty: .easy),
                Exercise(name: "Jump Rope", instructions: "Jump rope on balls of feet. Excellent calf conditioning and cardio. Stay on toes throughout.", duration: "3 sets of 1 minute", difficulty: .medium),
                Exercise(name: "Box Jumps", instructions: "Jump explosively onto box or step. Land softly on balls of feet. Step down. Builds calf power.", duration: "3 sets of 10 reps", difficulty: .hard)
            ]
            
        case .leftAnkle, .rightAnkle:
            return [
                Exercise(name: "Ankle Circles", instructions: "Lift foot, rotate ankle in full circles. Change direction. Improves ankle mobility and prevents stiffness.", duration: "10 circles each direction, both ankles", difficulty: .easy),
                Exercise(name: "Ankle Alphabet", instructions: "Using toe as pen, write alphabet in air. Works ankle through full range of motion.", duration: "1-2 sets per ankle", difficulty: .easy),
                Exercise(name: "Ankle Pumps", instructions: "Point toes away then pull back toward shin. Promotes circulation and ankle flexibility.", duration: "3 sets of 20 reps", difficulty: .easy),
                Exercise(name: "Resistance Band Ankle Flexion", instructions: "Loop band around foot. Pull toes toward shin against resistance. Strengthens anterior ankle muscles.", duration: "3 sets of 15 reps each ankle", difficulty: .medium)
            ]
            
        case .leftFoot, .rightFoot:
            return [
                Exercise(name: "Toe Curls", instructions: "Place towel on floor. Use toes to scrunch towel toward you. Strengthens foot intrinsic muscles.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Toe Spreads", instructions: "Spread toes apart as wide as possible. Hold 5 seconds. Repeat. Improves toe mobility and foot strength.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Heel-to-Toe Walk", instructions: "Walk placing heel directly in front of opposite foot's toes. Improves balance and foot coordination.", duration: "3 sets of 20 steps", difficulty: .easy),
                Exercise(name: "Single-Leg Balance", instructions: "Stand on one foot. Hold for time. Close eyes for more challenge. Builds ankle and foot stability.", duration: "3 sets of 30 seconds each foot", difficulty: .medium),
                Exercise(name: "Foot Massage", instructions: "Roll foot over tennis ball or massage ball. Apply pressure to sore spots. Releases plantar fascia tension.", duration: "3-5 minutes per foot", difficulty: .easy)
            ]
        }
    }
    
    var stretches: [Exercise] {
        switch self {
        case .head, .forehead, .eyes, .jaw, .ears:
            return [
                Exercise(name: "Neck Stretch", instructions: "Gently tilt head to side, hold 30 seconds. Switch sides. Stretches neck and reduces head tension.", duration: "2 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Chin Tuck Stretch", instructions: "Pull chin back, hold. Feel stretch at base of skull. Counteracts forward head posture.", duration: "3 sets of 20 seconds", difficulty: .easy)
            ]
            
        case .neck:
            return [
                Exercise(name: "Neck Side Stretch", instructions: "Tilt head toward shoulder. Use hand to gently pull further. Hold. Deep neck stretch.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Neck Rotation Stretch", instructions: "Turn head to look over shoulder. Hold. Gentle stretches for rotation muscles.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Upper Trapezius Stretch", instructions: "Tilt head away and slightly down. Opposite hand behind back. Stretches upper traps and neck.", duration: "3 sets of 30 seconds each side", difficulty: .easy)
            ]
            
        case .leftShoulder, .rightShoulder:
            return [
                Exercise(name: "Cross-Body Shoulder Stretch", instructions: "Bring arm across chest. Use other hand to pull it closer. Feel stretch in back of shoulder.", duration: "3 sets of 30 seconds each arm", difficulty: .easy),
                Exercise(name: "Overhead Tricep Stretch", instructions: "Reach arm overhead, bend elbow behind head. Use other hand to gently push elbow. Stretches shoulder and tricep.", duration: "3 sets of 30 seconds each arm", difficulty: .easy),
                Exercise(name: "Thread the Needle", instructions: "On hands and knees, thread one arm under body. Rotate torso. Stretches shoulder and upper back.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Doorway Chest Stretch", instructions: "Arm on door frame, step forward. Feel stretch in chest and front of shoulder. Opens shoulder.", duration: "3 sets of 30 seconds each arm", difficulty: .easy)
            ]
            
        case .chest:
            return [
                Exercise(name: "Doorway Chest Stretch", instructions: "Place forearm on door frame at shoulder height. Step through doorway until you feel stretch across chest.", duration: "3 sets of 30 seconds", difficulty: .easy),
                Exercise(name: "Lying Chest Stretch", instructions: "Lie face down, extend arms to sides. Roll onto one side. Deep stretch for pec muscles.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Wall Chest Opener", instructions: "Stand sideways to wall, arm extended back against wall. Rotate body away. Stretches entire chest.", duration: "3 sets of 30 seconds each side", difficulty: .easy)
            ]
            
        case .upperBack:
            return [
                Exercise(name: "Child's Pose", instructions: "Sit on heels, reach arms forward, lower chest toward ground. Deep relaxing stretch for entire back.", duration: "3 sets of 60 seconds", difficulty: .easy),
                Exercise(name: "Cat-Cow Stretch", instructions: "On hands and knees, alternate arching and rounding spine. Mobilizes entire spine.", duration: "10 slow repetitions", difficulty: .easy),
                Exercise(name: "Seated Spinal Twist", instructions: "Sit cross-legged. Place hand on opposite knee, twist torso. Look over shoulder. Stretches back and obliques.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Thread the Needle", instructions: "From hands and knees, thread one arm under body. Great for upper back and shoulder mobility.", duration: "3 sets of 30 seconds each side", difficulty: .easy)
            ]
            
        case .lowerBack:
            return [
                Exercise(name: "Knee to Chest", instructions: "Lie on back. Pull one knee to chest, hold. Alternate legs. Gentle lower back stretch.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Child's Pose", instructions: "Sit on heels, arms extended forward. Deep stretch for lower back and hips.", duration: "3 sets of 60 seconds", difficulty: .easy),
                Exercise(name: "Spinal Twist", instructions: "Lie on back. Drop bent knees to one side while looking opposite direction. Stretches lower back and spine.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Cat-Cow", instructions: "Hands and knees. Arch back, then round it. Mobilizes entire spine, especially lower back.", duration: "10 slow repetitions", difficulty: .easy)
            ]
            
        case .leftBicep, .rightBicep, .leftTricep, .rightTricep:
            return [
                Exercise(name: "Bicep Wall Stretch", instructions: "Extend arm to side against wall, thumb down. Turn body away. Stretches bicep and forearm.", duration: "3 sets of 30 seconds each arm", difficulty: .easy),
                Exercise(name: "Overhead Tricep Stretch", instructions: "Reach arm overhead, bend elbow. Use other hand to gently push elbow down. Deep tricep stretch.", duration: "3 sets of 30 seconds each arm", difficulty: .easy),
                Exercise(name: "Cross-Body Arm Stretch", instructions: "Extend arm across chest. Use other hand to pull it closer. Stretches shoulder and upper arm.", duration: "3 sets of 30 seconds each arm", difficulty: .easy)
            ]
            
        case .leftForearm, .rightForearm:
            return [
                Exercise(name: "Wrist Flexor Stretch", instructions: "Extend arm, palm up. Use other hand to gently pull fingers back. Stretches forearm flexors.", duration: "3 sets of 30 seconds each arm", difficulty: .easy),
                Exercise(name: "Wrist Extensor Stretch", instructions: "Extend arm, palm down. Use other hand to gently push hand down. Stretches forearm extensors.", duration: "3 sets of 30 seconds each arm", difficulty: .easy),
                Exercise(name: "Prayer Stretch", instructions: "Press palms together, lower toward waist. Stretches wrists and forearms.", duration: "3 sets of 30 seconds", difficulty: .easy)
            ]
            
        case .leftWrist, .rightWrist, .leftHand, .rightHand, .leftFingers, .rightFingers:
            return [
                Exercise(name: "Wrist Circles", instructions: "Rotate wrists in circles. Change direction. Improves wrist mobility.", duration: "10 circles each direction", difficulty: .easy),
                Exercise(name: "Finger Stretch", instructions: "Spread fingers wide, hold. Then make tight fist. Repeat. Stretches entire hand.", duration: "3 sets of 10 reps", difficulty: .easy),
                Exercise(name: "Prayer Stretch", instructions: "Press palms together, lower hands while keeping palms touching. Stretches wrists.", duration: "3 sets of 30 seconds", difficulty: .easy)
            ]
            
        case .abs, .obliques:
            return [
                Exercise(name: "Cobra Stretch", instructions: "Lie face down. Push upper body up with arms, arch back. Stretches abs and hip flexors.", duration: "3 sets of 30 seconds", difficulty: .easy),
                Exercise(name: "Side Bend Stretch", instructions: "Stand tall, reach arm overhead. Bend to opposite side. Stretches obliques and lateral core.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Cat-Cow", instructions: "Hands and knees. Arch back, then round. Stretches entire core and spine.", duration: "10 slow repetitions", difficulty: .easy)
            ]
            
        case .hips:
            return [
                Exercise(name: "Pigeon Pose", instructions: "Front leg bent, back leg extended. Lower hips toward ground. Deep hip stretch.", duration: "3 sets of 60 seconds each side", difficulty: .medium),
                Exercise(name: "90/90 Hip Stretch", instructions: "Sit with both legs at 90 degrees. Lean forward over front leg. Excellent hip mobility stretch.", duration: "3 sets of 30 seconds each side", difficulty: .medium),
                Exercise(name: "Butterfly Stretch", instructions: "Sit with soles of feet together. Gently press knees toward ground. Hip opener.", duration: "3 sets of 60 seconds", difficulty: .easy),
                Exercise(name: "Hip Flexor Lunge", instructions: "Lunge position, back knee on ground. Push hips forward. Stretches hip flexors.", duration: "3 sets of 30 seconds each side", difficulty: .easy)
            ]
            
        case .leftThigh, .rightThigh:
            return [
                Exercise(name: "Quad Stretch", instructions: "Stand on one leg. Pull other foot to glutes. Keep knees together. Stretches quadriceps.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Hamstring Stretch", instructions: "Sit with one leg extended, other bent. Reach toward toes of extended leg. Stretches hamstrings.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Lying Quad Stretch", instructions: "Lie on side. Pull top foot to glutes. Deep quad stretch.", duration: "3 sets of 30 seconds each side", difficulty: .easy),
                Exercise(name: "Standing Hamstring Stretch", instructions: "Place heel on low surface. Lean forward keeping back straight. Feel stretch in back of thigh.", duration: "3 sets of 30 seconds each leg", difficulty: .easy)
            ]
            
        case .leftKnee, .rightKnee:
            return [
                Exercise(name: "Quad Stretch", instructions: "Pull foot to glutes while standing. Stretches quad and knee area.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Hamstring Stretch", instructions: "Extend leg, bend forward. Stretches back of knee.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Knee Circles", instructions: "Hands on knees, make circles. Mobilizes knee joint.", duration: "10 circles each direction", difficulty: .easy)
            ]
            
        case .leftCalf, .rightCalf:
            return [
                Exercise(name: "Wall Calf Stretch", instructions: "Hands on wall, one foot back, heel down. Lean forward. Stretches gastrocnemius.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Bent Knee Calf Stretch", instructions: "Same as wall stretch but bend back knee. Targets soleus muscle.", duration: "3 sets of 30 seconds each leg", difficulty: .easy),
                Exercise(name: "Downward Dog", instructions: "Hands and feet on ground, hips high. Press heels toward ground. Stretches calves and hamstrings.", duration: "3 sets of 30 seconds", difficulty: .easy)
            ]
            
        case .leftAnkle, .rightAnkle:
            return [
                Exercise(name: "Ankle Circles", instructions: "Rotate ankle in full circles. Improves mobility.", duration: "10 circles each direction", difficulty: .easy),
                Exercise(name: "Towel Ankle Stretch", instructions: "Loop towel around ball of foot. Pull toes toward body. Stretches calf and ankle.", duration: "3 sets of 30 seconds each ankle", difficulty: .easy),
                Exercise(name: "Kneeling Ankle Stretch", instructions: "Kneel with tops of feet on ground. Sit back on heels. Stretches top of ankle and foot.", duration: "3 sets of 30 seconds", difficulty: .easy)
            ]
            
        case .leftFoot, .rightFoot:
            return [
                Exercise(name: "Toe Stretch", instructions: "Pull toes back with hands. Stretches plantar fascia and toes.", duration: "3 sets of 30 seconds each foot", difficulty: .easy),
                Exercise(name: "Foot Roll", instructions: "Roll foot over tennis ball. Apply pressure. Releases foot tension.", duration: "2-3 minutes per foot", difficulty: .easy),
                Exercise(name: "Toe Spread", instructions: "Spread toes apart, hold. Improves toe mobility.", duration: "3 sets of 10 second holds", difficulty: .easy)
            ]
        }
    }
    
    var massages: [Exercise] {
        switch self {
        case .head:
            return [
                Exercise(name: "Scalp Massage", instructions: "Use fingertips to massage scalp in circular motions. Cover entire head. Relieves tension and promotes circulation.", duration: "5-10 minutes", difficulty: .easy),
                Exercise(name: "Temple Massage", instructions: "Use fingertips on temples. Apply gentle pressure with circular motions. Relieves headache tension.", duration: "3-5 minutes", difficulty: .easy)
            ]
            
        case .forehead:
            return [
                Exercise(name: "Forehead Smoothing", instructions: "Use fingers to stroke from center of forehead outward toward temples. Gentle pressure. Releases tension.", duration: "3-5 minutes", difficulty: .easy),
                Exercise(name: "Eyebrow Massage", instructions: "Pinch and massage along eyebrow line. Releases tension from screen time and stress.", duration: "3 minutes", difficulty: .easy)
            ]
            
        case .eyes:
            return [
                Exercise(name: "Eye Socket Massage", instructions: "Gently massage around eye socket using fingertips. Be very gentle. Relieves eye strain.", duration: "2-3 minutes", difficulty: .easy),
                Exercise(name: "Palming", instructions: "Rub hands together. Cup over closed eyes without touching. Feel warmth. Relaxes eye muscles.", duration: "3-5 minutes", difficulty: .easy)
            ]
            
        case .jaw:
            return [
                Exercise(name: "TMJ Massage", instructions: "Use fingertips to massage jaw joint (in front of ears). Circular motions. Relieves jaw tension and TMJ pain.", duration: "5 minutes per side", difficulty: .easy),
                Exercise(name: "Jaw Muscle Massage", instructions: "Massage masseter muscle (side of jaw below cheekbone). Apply firm pressure. Releases clenching tension.", duration: "5 minutes per side", difficulty: .easy)
            ]
            
        case .ears:
            return [
                Exercise(name: "Ear Massage", instructions: "Massage entire ear including lobes. Gentle circular motions. Promotes relaxation and circulation.", duration: "3-5 minutes per ear", difficulty: .easy),
                Exercise(name: "Behind Ear Massage", instructions: "Massage area behind ears with circular motions. Releases tension from neck and jaw.", duration: "3 minutes", difficulty: .easy)
            ]
            
        case .neck:
            return [
                Exercise(name: "Neck Kneading", instructions: "Use opposite hand to knead neck muscles. Firm but gentle pressure. Work from base of skull down to shoulders.", duration: "5-10 minutes", difficulty: .easy),
                Exercise(name: "Upper Trapezius Massage", instructions: "Squeeze and release upper shoulder/neck muscles. Releases common tension spot.", duration: "5 minutes per side", difficulty: .easy),
                Exercise(name: "Neck Roll with Pressure", instructions: "Apply gentle pressure with hand while slowly rolling neck. Combines movement with massage.", duration: "3-5 minutes", difficulty: .easy)
            ]
            
        case .leftShoulder, .rightShoulder:
            return [
                Exercise(name: "Shoulder Kneading", instructions: "Use opposite hand to knead shoulder muscle. Circular and squeezing motions. Releases shoulder tension.", duration: "5-10 minutes per shoulder", difficulty: .easy),
                Exercise(name: "Tennis Ball Shoulder Roll", instructions: "Place tennis ball between shoulder and wall. Roll against wall. Targets trigger points.", duration: "3-5 minutes per shoulder", difficulty: .medium),
                Exercise(name: "Rotator Cuff Massage", instructions: "Reach across to massage around shoulder joint. Gentle circular pressure. Improves mobility.", duration: "5 minutes per shoulder", difficulty: .easy)
            ]
            
        case .chest:
            return [
                Exercise(name: "Pec Massage", instructions: "Use opposite hand to massage chest muscle. Work from sternum toward armpit. Releases chest tightness.", duration: "5 minutes per side", difficulty: .easy),
                Exercise(name: "Ball Release", instructions: "Lie face down with ball under chest muscle. Apply body weight. Roll gently. Deep tissue release.", duration: "3-5 minutes per side", difficulty: .medium)
            ]
            
        case .upperBack, .lowerBack:
            return [
                Exercise(name: "Tennis Ball Back Release", instructions: "Lie on back with tennis ball under muscles on either side of spine. Roll slowly. Releases back tension.", duration: "5-10 minutes", difficulty: .medium),
                Exercise(name: "Foam Roller Upper Back", instructions: "Lie on foam roller positioned across upper back. Roll up and down. Releases thoracic spine tension.", duration: "5-10 minutes", difficulty: .medium),
                Exercise(name: "Lower Back Kneading", instructions: "Use thumbs to apply pressure on lower back muscles. Small circular motions. Be gentle on spine area.", duration: "5-10 minutes", difficulty: .easy)
            ]
            
        case .leftBicep, .rightBicep, .leftTricep, .rightTricep:
            return [
                Exercise(name: "Arm Kneading", instructions: "Use opposite hand to squeeze and knead arm muscle. Work from shoulder to elbow. Releases arm tension.", duration: "5 minutes per arm", difficulty: .easy),
                Exercise(name: "Compression Massage", instructions: "Wrap hand around arm, apply pressure, and slide down. Promotes circulation and recovery.", duration: "3-5 minutes per arm", difficulty: .easy)
            ]
            
        case .leftForearm, .rightForearm:
            return [
                Exercise(name: "Forearm Kneading", instructions: "Use opposite thumb to massage forearm muscles. Work both flexor and extensor sides. Relieves computer strain.", duration: "5 minutes per arm", difficulty: .easy),
                Exercise(name: "Wrist and Forearm Stretching Massage", instructions: "Combine gentle stretching with pressure on forearm muscles. Excellent for desk workers.", duration: "5 minutes per arm", difficulty: .easy)
            ]
            
        case .leftWrist, .rightWrist:
            return [
                Exercise(name: "Wrist Circling", instructions: "Hold wrist with opposite hand. Make gentle circles. Loosens wrist joint.", duration: "3 minutes per wrist", difficulty: .easy),
                Exercise(name: "Wrist Pressure Points", instructions: "Apply pressure to inner wrist. Hold for 30 seconds. Releases tension and promotes relaxation.", duration: "3 minutes per wrist", difficulty: .easy)
            ]
            
        case .leftHand, .rightHand:
            return [
                Exercise(name: "Palm Massage", instructions: "Use opposite thumb to massage palm in circular motions. Work entire palm. Releases hand tension.", duration: "5 minutes per hand", difficulty: .easy),
                Exercise(name: "Hand Squeezing", instructions: "Squeeze all over hand, working between bones. Promotes circulation.", duration: "3-5 minutes per hand", difficulty: .easy)
            ]
            
        case .leftFingers, .rightFingers:
            return [
                Exercise(name: "Finger Pulls", instructions: "Gently pull each finger, starting at base and sliding to tip. Releases finger tension.", duration: "2 minutes per hand", difficulty: .easy),
                Exercise(name: "Finger Joint Massage", instructions: "Massage each finger joint with circular motions. Excellent for arthritis or stiffness.", duration: "3 minutes per hand", difficulty: .easy)
            ]
            
        case .abs:
            return [
                Exercise(name: "Abdominal Massage", instructions: "Use hands to massage abdomen in clockwise circles. Gentle pressure. Aids digestion and relieves tension.", duration: "5-10 minutes", difficulty: .easy),
                Exercise(name: "Deep Belly Massage", instructions: "Use fingertips to apply deeper pressure in circular motions. Releases deep core tension.", duration: "5 minutes", difficulty: .medium)
            ]
            
        case .obliques:
            return [
                Exercise(name: "Side Body Massage", instructions: "Use hands to massage along sides of torso. Work from ribs to hips. Releases side tension.", duration: "5 minutes per side", difficulty: .easy),
                Exercise(name: "Rib Cage Massage", instructions: "Massage between ribs with fingertips. Gentle pressure. Improves breathing and releases tension.", duration: "5 minutes", difficulty: .easy)
            ]
            
        case .hips:
            return [
                Exercise(name: "Hip Flexor Release", instructions: "Apply pressure to front of hip/groin area. Hold and breathe. Releases tight hip flexors.", duration: "5 minutes per side", difficulty: .medium),
                Exercise(name: "Glute Massage", instructions: "Lie on side. Use tennis ball or massage tool on glute muscles. Roll slowly. Deep tissue release.", duration: "5-10 minutes per side", difficulty: .medium),
                Exercise(name: "Hip Joint Massage", instructions: "Massage around hip joint with circular motions. Improves mobility.", duration: "5 minutes per side", difficulty: .easy)
            ]
            
        case .leftThigh, .rightThigh:
            return [
                Exercise(name: "Quad Massage", instructions: "Use hands or foam roller to massage front of thigh. Long strokes from knee to hip. Releases quad tension.", duration: "5-10 minutes per leg", difficulty: .easy),
                Exercise(name: "Hamstring Massage", instructions: "Massage back of thigh with hands or sit on ball. Work from knee to hip. Releases hamstring tightness.", duration: "5-10 minutes per leg", difficulty: .easy),
                Exercise(name: "IT Band Roller", instructions: "Lie on side with foam roller under thigh. Roll from hip to knee. Can be intense but very effective.", duration: "3-5 minutes per leg", difficulty: .hard)
            ]
            
        case .leftKnee, .rightKnee:
            return [
                Exercise(name: "Knee Cap Massage", instructions: "Gently massage around knee cap. Circular motions. Relieves knee stiffness.", duration: "5 minutes per knee", difficulty: .easy),
                Exercise(name: "Patellar Tendon Massage", instructions: "Massage below knee cap with gentle pressure. Helps with tendon issues.", duration: "3-5 minutes per knee", difficulty: .easy)
            ]
            
        case .leftCalf, .rightCalf:
            return [
                Exercise(name: "Calf Kneading", instructions: "Sit with leg bent. Use both hands to knead calf muscle. Work from ankle to knee. Releases calf tension.", duration: "5-10 minutes per calf", difficulty: .easy),
                Exercise(name: "Calf Roller", instructions: "Use foam roller or rolling pin on calf. Roll from ankle to knee. Excellent post-workout recovery.", duration: "5 minutes per calf", difficulty: .medium)
            ]
            
        case .leftAnkle, .rightAnkle:
            return [
                Exercise(name: "Ankle Massage", instructions: "Massage around ankle joint with circular motions. Reduces swelling and improves mobility.", duration: "5 minutes per ankle", difficulty: .easy),
                Exercise(name: "Achilles Massage", instructions: "Gently massage Achilles tendon above heel. Pinch and roll technique. Prevents tendon issues.", duration: "3-5 minutes per ankle", difficulty: .easy)
            ]
            
        case .leftFoot, .rightFoot:
            return [
                Exercise(name: "Foot Massage", instructions: "Use thumbs to massage entire foot. Work arch, heel, and ball of foot. Relieves foot pain and tension.", duration: "10 minutes per foot", difficulty: .easy),
                Exercise(name: "Ball Roll", instructions: "Roll foot over tennis or massage ball. Apply pressure to sore spots. Releases plantar fascia.", duration: "5-10 minutes per foot", difficulty: .medium),
                Exercise(name: "Reflexology Points", instructions: "Apply pressure to reflexology points on foot. Hold each for 30 seconds. Promotes overall wellness.", duration: "10 minutes per foot", difficulty: .easy)
            ]
        }
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
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }
}

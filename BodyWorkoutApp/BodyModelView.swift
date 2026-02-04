import SwiftUI
import SceneKit

// MARK: - 3D Body Model View
struct BodyModelView: View {
    @Binding var selectedBodyPart: BodyPart?
    @Binding var showingSelection: Bool
    @State private var rotationAngle: Float = 0
    @State private var isAutoRotating = true
    @State private var zoomLevel: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Grey background
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            SceneKitView(
                rotationAngle: $rotationAngle,
                isAutoRotating: $isAutoRotating,
                selectedBodyPart: $selectedBodyPart,
                showingSelection: $showingSelection,
                zoomLevel: $zoomLevel
            )
            .edgesIgnoringSafeArea(.all)
            
            // Zoom Controls (Top Right)
            VStack {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 10) {
                        // Zoom In Button
                        Button(action: {
                            withAnimation(.spring(response: 0.3)) {
                                zoomLevel = min(zoomLevel + 0.2, 5.0)
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 44))
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color.black.opacity(0.6))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        
                        // Current Zoom Level
                        Text("\(Int(zoomLevel * 100))%")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(8)
                        
                        // Zoom Out Button
                        Button(action: {
                            withAnimation(.spring(response: 0.3)) {
                                zoomLevel = max(zoomLevel - 0.2, 0.3)
                            }
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .font(.system(size: 44))
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color.black.opacity(0.6))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        
                        // Reset Zoom Button
                        Button(action: {
                            withAnimation(.spring(response: 0.3)) {
                                zoomLevel = 1.0
                            }
                        }) {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color.black.opacity(0.6))
                                        .frame(width: 42, height: 42)
                                )
                        }
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Bottom Instructions
                HStack(spacing: 20) {
                    InstructionBadge(icon: "hand.draw", text: "Swipe to rotate")
                    InstructionBadge(icon: "plus.magnifyingglass", text: "Use + / -")
                    InstructionBadge(icon: "hand.tap", text: "Tap body parts")
                }
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(15)
                .padding(.bottom, 30)
            }
        }
        .onAppear {
            startAutoRotation()
        }
    }
    
    func startAutoRotation() {
        isAutoRotating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isAutoRotating = false
        }
    }
}

// MARK: - Instruction Badge
struct InstructionBadge: View {
    let icon: String
    let text: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title3)
            Text(text)
                .font(.caption2)
        }
        .foregroundColor(.white)
    }
}

// MARK: - SceneKit View Wrapper
struct SceneKitView: UIViewRepresentable {
    @Binding var rotationAngle: Float
    @Binding var isAutoRotating: Bool
    @Binding var selectedBodyPart: BodyPart?
    @Binding var showingSelection: Bool
    @Binding var zoomLevel: CGFloat
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = createScene()
        sceneView.backgroundColor = UIColor.clear
        sceneView.allowsCameraControl = false
        sceneView.autoenablesDefaultLighting = true
        
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        sceneView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        sceneView.addGestureRecognizer(pinchGesture)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        context.coordinator.sceneView = sceneView
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        if isAutoRotating {
            context.coordinator.autoRotate()
        }
        
        // Update scale when zoom buttons are used
        if let scene = uiView.scene,
           let bodyNode = scene.rootNode.childNode(withName: "body", recursively: true) {
            bodyNode.scale = SCNVector3(zoomLevel, zoomLevel, zoomLevel)
            context.coordinator.currentScale = zoomLevel
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func createScene() -> SCNScene {
        let scene = SCNScene()
        
        let bodyNode = createBodyModel()
        scene.rootNode.addChildNode(bodyNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 5, z: 5)
        scene.rootNode.addChildNode(lightNode)
        
        let ambientLight = SCNNode()
        ambientLight.light = SCNLight()
        ambientLight.light?.type = .ambient
        ambientLight.light?.color = UIColor.white.withAlphaComponent(0.3)
        scene.rootNode.addChildNode(ambientLight)
        
        return scene
    }
    
    func createBodyModel() -> SCNNode {
        let bodyContainer = SCNNode()
        bodyContainer.name = "body"
        
        // HEAD & FACE
        let head = createBodyPart(
            geometry: SCNSphere(radius: 0.12),
            position: SCNVector3(0, 0.7, 0),
            color: .systemPink,
            name: "head"
        )
        bodyContainer.addChildNode(head)
        
        // Forehead
        let forehead = createBodyPart(
            geometry: SCNBox(width: 0.18, height: 0.05, length: 0.02, chamferRadius: 0.01),
            position: SCNVector3(0, 0.75, 0.08),
            color: .systemPink.withAlphaComponent(0.9),
            name: "forehead"
        )
        bodyContainer.addChildNode(forehead)
        
        // Eyes
        let leftEye = createBodyPart(
            geometry: SCNSphere(radius: 0.02),
            position: SCNVector3(-0.04, 0.72, 0.1),
            color: .white,
            name: "eyes"
        )
        bodyContainer.addChildNode(leftEye)
        
        let rightEye = createBodyPart(
            geometry: SCNSphere(radius: 0.02),
            position: SCNVector3(0.04, 0.72, 0.1),
            color: .white,
            name: "eyes"
        )
        bodyContainer.addChildNode(rightEye)
        
        // Jaw
        let jaw = createBodyPart(
            geometry: SCNBox(width: 0.12, height: 0.08, length: 0.12, chamferRadius: 0.03),
            position: SCNVector3(0, 0.64, 0.02),
            color: .systemPink.withAlphaComponent(0.9),
            name: "jaw"
        )
        bodyContainer.addChildNode(jaw)
        
        // Ears
        let leftEar = createBodyPart(
            geometry: SCNSphere(radius: 0.03),
            position: SCNVector3(-0.11, 0.7, 0),
            color: .systemPink.withAlphaComponent(0.8),
            name: "ears"
        )
        bodyContainer.addChildNode(leftEar)
        
        let rightEar = createBodyPart(
            geometry: SCNSphere(radius: 0.03),
            position: SCNVector3(0.11, 0.7, 0),
            color: .systemPink.withAlphaComponent(0.8),
            name: "ears"
        )
        bodyContainer.addChildNode(rightEar)
        
        // NECK
        let neck = createBodyPart(
            geometry: SCNCylinder(radius: 0.055, height: 0.12),
            position: SCNVector3(0, 0.56, 0),
            color: .systemOrange,
            name: "neck"
        )
        bodyContainer.addChildNode(neck)
        
        // UPPER BODY - Chest
        let chest = createBodyPart(
            geometry: SCNBox(width: 0.35, height: 0.35, length: 0.18, chamferRadius: 0.06),
            position: SCNVector3(0, 0.3, 0),
            color: .systemBlue,
            name: "chest"
        )
        bodyContainer.addChildNode(chest)
        
        // Upper Back
        let upperBack = createBodyPart(
            geometry: SCNBox(width: 0.35, height: 0.25, length: 0.12, chamferRadius: 0.04),
            position: SCNVector3(0, 0.35, -0.15),
            color: .brown,
            name: "upperBack"
        )
        bodyContainer.addChildNode(upperBack)
        
        // SHOULDERS
        let leftShoulder = createBodyPart(
            geometry: SCNSphere(radius: 0.075),
            position: SCNVector3(-0.22, 0.45, 0),
            color: .systemYellow,
            name: "leftShoulder"
        )
        bodyContainer.addChildNode(leftShoulder)
        
        let rightShoulder = createBodyPart(
            geometry: SCNSphere(radius: 0.075),
            position: SCNVector3(0.22, 0.45, 0),
            color: .systemYellow,
            name: "rightShoulder"
        )
        bodyContainer.addChildNode(rightShoulder)
        
        // ARMS - Biceps
        let leftBicep = createBodyPart(
            geometry: SCNCylinder(radius: 0.05, height: 0.22),
            position: SCNVector3(-0.22, 0.28, 0),
            color: .systemTeal,
            name: "leftBicep"
        )
        bodyContainer.addChildNode(leftBicep)
        
        let rightBicep = createBodyPart(
            geometry: SCNCylinder(radius: 0.05, height: 0.22),
            position: SCNVector3(0.22, 0.28, 0),
            color: .systemTeal,
            name: "rightBicep"
        )
        bodyContainer.addChildNode(rightBicep)
        
        // Elbows
        let leftElbow = createBodyPart(
            geometry: SCNSphere(radius: 0.045),
            position: SCNVector3(-0.22, 0.16, 0),
            color: .systemTeal.withAlphaComponent(0.8),
            name: "leftBicep"
        )
        bodyContainer.addChildNode(leftElbow)
        
        let rightElbow = createBodyPart(
            geometry: SCNSphere(radius: 0.045),
            position: SCNVector3(0.22, 0.16, 0),
            color: .systemTeal.withAlphaComponent(0.8),
            name: "rightBicep"
        )
        bodyContainer.addChildNode(rightElbow)
        
        // Forearms
        let leftForearm = createBodyPart(
            geometry: SCNCylinder(radius: 0.04, height: 0.20),
            position: SCNVector3(-0.22, 0.02, 0),
            color: .cyan,
            name: "leftForearm"
        )
        bodyContainer.addChildNode(leftForearm)
        
        let rightForearm = createBodyPart(
            geometry: SCNCylinder(radius: 0.04, height: 0.20),
            position: SCNVector3(0.22, 0.02, 0),
            color: .cyan,
            name: "rightForearm"
        )
        bodyContainer.addChildNode(rightForearm)
        
        // Wrists
        let leftWrist = createBodyPart(
            geometry: SCNSphere(radius: 0.035),
            position: SCNVector3(-0.22, -0.09, 0),
            color: .systemTeal.withAlphaComponent(0.7),
            name: "leftWrist"
        )
        bodyContainer.addChildNode(leftWrist)
        
        let rightWrist = createBodyPart(
            geometry: SCNSphere(radius: 0.035),
            position: SCNVector3(0.22, -0.09, 0),
            color: .systemTeal.withAlphaComponent(0.7),
            name: "rightWrist"
        )
        bodyContainer.addChildNode(rightWrist)
        
        // HANDS
        let leftHand = createBodyPart(
            geometry: SCNBox(width: 0.06, height: 0.08, length: 0.03, chamferRadius: 0.01),
            position: SCNVector3(-0.22, -0.15, 0),
            color: .systemPink.withAlphaComponent(0.9),
            name: "leftHand"
        )
        bodyContainer.addChildNode(leftHand)
        
        let rightHand = createBodyPart(
            geometry: SCNBox(width: 0.06, height: 0.08, length: 0.03, chamferRadius: 0.01),
            position: SCNVector3(0.22, -0.15, 0),
            color: .systemPink.withAlphaComponent(0.9),
            name: "rightHand"
        )
        bodyContainer.addChildNode(rightHand)
        
        // Fingers
        for i in 0..<4 {
            let offset = -0.025 + (Float(i) * 0.015)
            
            let leftFinger = createBodyPart(
                geometry: SCNBox(width: 0.008, height: 0.03, length: 0.01, chamferRadius: 0.002),
                position: SCNVector3(-0.22 + offset, -0.19, 0.01),
                color: .systemPink.withAlphaComponent(0.8),
                name: "leftFingers"
            )
            bodyContainer.addChildNode(leftFinger)
            
            let rightFinger = createBodyPart(
                geometry: SCNBox(width: 0.008, height: 0.03, length: 0.01, chamferRadius: 0.002),
                position: SCNVector3(0.22 + offset, -0.19, 0.01),
                color: .systemPink.withAlphaComponent(0.8),
                name: "rightFingers"
            )
            bodyContainer.addChildNode(rightFinger)
        }
        
        // CORE - Abs
        let abs = createBodyPart(
            geometry: SCNBox(width: 0.30, height: 0.22, length: 0.16, chamferRadius: 0.04),
            position: SCNVector3(0, 0.05, 0),
            color: .systemGreen,
            name: "abs"
        )
        bodyContainer.addChildNode(abs)
        
        // Obliques
        let leftOblique = createBodyPart(
            geometry: SCNBox(width: 0.08, height: 0.20, length: 0.14, chamferRadius: 0.02),
            position: SCNVector3(-0.19, 0.05, 0),
            color: .systemGreen.withAlphaComponent(0.8),
            name: "obliques"
        )
        bodyContainer.addChildNode(leftOblique)
        
        let rightOblique = createBodyPart(
            geometry: SCNBox(width: 0.08, height: 0.20, length: 0.14, chamferRadius: 0.02),
            position: SCNVector3(0.19, 0.05, 0),
            color: .systemGreen.withAlphaComponent(0.8),
            name: "obliques"
        )
        bodyContainer.addChildNode(rightOblique)
        
        // Lower Back
        let lowerBack = createBodyPart(
            geometry: SCNBox(width: 0.30, height: 0.18, length: 0.12, chamferRadius: 0.03),
            position: SCNVector3(0, 0.05, -0.14),
            color: .brown.withAlphaComponent(0.9),
            name: "lowerBack"
        )
        bodyContainer.addChildNode(lowerBack)
        
        // HIPS
        let hips = createBodyPart(
            geometry: SCNBox(width: 0.32, height: 0.12, length: 0.18, chamferRadius: 0.03),
            position: SCNVector3(0, -0.10, 0),
            color: .systemMint,
            name: "hips"
        )
        bodyContainer.addChildNode(hips)
        
        // LEGS - Thighs
        let leftThigh = createBodyPart(
            geometry: SCNCylinder(radius: 0.075, height: 0.35),
            position: SCNVector3(-0.11, -0.38, 0),
            color: .systemIndigo,
            name: "leftThigh"
        )
        bodyContainer.addChildNode(leftThigh)
        
        let rightThigh = createBodyPart(
            geometry: SCNCylinder(radius: 0.075, height: 0.35),
            position: SCNVector3(0.11, -0.38, 0),
            color: .systemIndigo,
            name: "rightThigh"
        )
        bodyContainer.addChildNode(rightThigh)
        
        // Knees
        let leftKnee = createBodyPart(
            geometry: SCNSphere(radius: 0.06),
            position: SCNVector3(-0.11, -0.57, 0),
            color: .systemIndigo.withAlphaComponent(0.8),
            name: "leftKnee"
        )
        bodyContainer.addChildNode(leftKnee)
        
        let rightKnee = createBodyPart(
            geometry: SCNSphere(radius: 0.06),
            position: SCNVector3(0.11, -0.57, 0),
            color: .systemIndigo.withAlphaComponent(0.8),
            name: "rightKnee"
        )
        bodyContainer.addChildNode(rightKnee)
        
        // Calves
        let leftCalf = createBodyPart(
            geometry: SCNCylinder(radius: 0.055, height: 0.30),
            position: SCNVector3(-0.11, -0.78, 0),
            color: .cyan,
            name: "leftCalf"
        )
        bodyContainer.addChildNode(leftCalf)
        
        let rightCalf = createBodyPart(
            geometry: SCNCylinder(radius: 0.055, height: 0.30),
            position: SCNVector3(0.11, -0.78, 0),
            color: .cyan,
            name: "rightCalf"
        )
        bodyContainer.addChildNode(rightCalf)
        
        // Ankles
        let leftAnkle = createBodyPart(
            geometry: SCNSphere(radius: 0.045),
            position: SCNVector3(-0.11, -0.94, 0),
            color: .systemTeal,
            name: "leftAnkle"
        )
        bodyContainer.addChildNode(leftAnkle)
        
        let rightAnkle = createBodyPart(
            geometry: SCNSphere(radius: 0.045),
            position: SCNVector3(0.11, -0.94, 0),
            color: .systemTeal,
            name: "rightAnkle"
        )
        bodyContainer.addChildNode(rightAnkle)
        
        // FEET
        let leftFoot = createBodyPart(
            geometry: SCNBox(width: 0.08, height: 0.06, length: 0.14, chamferRadius: 0.02),
            position: SCNVector3(-0.11, -1.0, 0.04),
            color: .gray,
            name: "leftFoot"
        )
        bodyContainer.addChildNode(leftFoot)
        
        let rightFoot = createBodyPart(
            geometry: SCNBox(width: 0.08, height: 0.06, length: 0.14, chamferRadius: 0.02),
            position: SCNVector3(0.11, -1.0, 0.04),
            color: .gray,
            name: "rightFoot"
        )
        bodyContainer.addChildNode(rightFoot)
        
        return bodyContainer
    }
    
    func createBodyPart(geometry: SCNGeometry, position: SCNVector3, color: UIColor, name: String) -> SCNNode {
        let node = SCNNode(geometry: geometry)
        node.position = position
        node.name = name
        
        let material = SCNMaterial()
        material.diffuse.contents = color.withAlphaComponent(0.8)
        material.specular.contents = UIColor.white
        geometry.materials = [material]
        
        return node
    }
    
    class Coordinator: NSObject {
        var parent: SceneKitView
        var sceneView: SCNView?
        var currentScale: CGFloat = 1.0
        var autoRotationAngle: Float = 0
        var lastScale: CGFloat = 1.0
        
        init(_ parent: SceneKitView) {
            self.parent = parent
        }
        
        func autoRotate() {
            guard let scene = sceneView?.scene,
                  let bodyNode = scene.rootNode.childNode(withName: "body", recursively: true) else {
                return
            }
            
            autoRotationAngle += 0.02
            bodyNode.eulerAngles.y = autoRotationAngle
            
            if autoRotationAngle >= Float.pi * 2 {
                parent.isAutoRotating = false
                autoRotationAngle = 0
            }
        }
        
        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            guard let scene = sceneView?.scene,
                  let bodyNode = scene.rootNode.childNode(withName: "body", recursively: true) else {
                return
            }
            
            let translation = gesture.translation(in: gesture.view)
            let rotationSpeed: Float = 0.01
            bodyNode.eulerAngles.y += Float(translation.x) * rotationSpeed
            bodyNode.eulerAngles.x += Float(translation.y) * rotationSpeed
            
            gesture.setTranslation(.zero, in: gesture.view)
        }
        
        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let scene = sceneView?.scene,
                  let bodyNode = scene.rootNode.childNode(withName: "body", recursively: true) else {
                return
            }
            
            switch gesture.state {
            case .began:
                lastScale = currentScale
                
            case .changed:
                let scale = gesture.scale
                currentScale = lastScale * scale
                currentScale = min(max(currentScale, 0.3), 5.0)
                
                bodyNode.scale = SCNVector3(currentScale, currentScale, currentScale)
                parent.zoomLevel = currentScale
                
            default:
                break
            }
        }
        
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let sceneView = sceneView else { return }
            
            let location = gesture.location(in: sceneView)
            let hitResults = sceneView.hitTest(location, options: [:])
            
            if let hitNode = hitResults.first?.node,
               let nodeName = hitNode.name,
               let bodyPart = mapNodeNameToBodyPart(nodeName) {
                
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
                parent.selectedBodyPart = bodyPart
                parent.showingSelection = true
            }
        }
        
        func mapNodeNameToBodyPart(_ nodeName: String) -> BodyPart? {
            switch nodeName {
            case "head": return .head
            case "forehead": return .forehead
            case "eyes": return .eyes
            case "jaw": return .jaw
            case "ears": return .ears
            case "neck": return .neck
            case "leftShoulder": return .leftShoulder
            case "rightShoulder": return .rightShoulder
            case "chest": return .chest
            case "upperBack": return .upperBack
            case "lowerBack": return .lowerBack
            case "leftBicep": return .leftBicep
            case "rightBicep": return .rightBicep
            case "leftForearm": return .leftForearm
            case "rightForearm": return .rightForearm
            case "leftWrist": return .leftWrist
            case "rightWrist": return .rightWrist
            case "leftHand": return .leftHand
            case "rightHand": return .rightHand
            case "leftFingers": return .leftFingers
            case "rightFingers": return .rightFingers
            case "abs": return .abs
            case "obliques": return .obliques
            case "hips": return .hips
            case "leftThigh": return .leftThigh
            case "rightThigh": return .rightThigh
            case "leftKnee": return .leftKnee
            case "rightKnee": return .rightKnee
            case "leftCalf": return .leftCalf
            case "rightCalf": return .rightCalf
            case "leftAnkle": return .leftAnkle
            case "rightAnkle": return .rightAnkle
            case "leftFoot": return .leftFoot
            case "rightFoot": return .rightFoot
            default: return nil
            }
        }
    }
}

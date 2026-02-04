import SwiftUI
import SceneKit

// MARK: - 3D Body Model View
struct BodyModelView: View {
    @Binding var selectedBodyPart: BodyPart?
    @Binding var showingSelection: Bool
    @State private var rotationAngle: Float = 0
    @State private var isAutoRotating = true
    
    var body: some View {
        ZStack {
            SceneKitView(
                rotationAngle: $rotationAngle,
                isAutoRotating: $isAutoRotating,
                selectedBodyPart: $selectedBodyPart,
                showingSelection: $showingSelection
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    InstructionBadge(icon: "hand.draw", text: "Swipe to rotate")
                    InstructionBadge(icon: "magnifyingglass", text: "Pinch to zoom")
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
        
        let head = createBodyPart(
            geometry: SCNSphere(radius: 0.15),
            position: SCNVector3(0, 0.65, 0),
            color: .systemPink,
            name: "head"
        )
        bodyContainer.addChildNode(head)
        
        let neck = createBodyPart(
            geometry: SCNCylinder(radius: 0.06, height: 0.1),
            position: SCNVector3(0, 0.52, 0),
            color: .systemOrange,
            name: "neck"
        )
        bodyContainer.addChildNode(neck)
        
        let torso = createBodyPart(
            geometry: SCNBox(width: 0.4, height: 0.5, length: 0.2, chamferRadius: 0.05),
            position: SCNVector3(0, 0.2, 0),
            color: .systemBlue,
            name: "chest"
        )
        bodyContainer.addChildNode(torso)
        
        let leftShoulder = createBodyPart(
            geometry: SCNSphere(radius: 0.08),
            position: SCNVector3(-0.25, 0.4, 0),
            color: .systemYellow,
            name: "leftShoulder"
        )
        bodyContainer.addChildNode(leftShoulder)
        
        let rightShoulder = createBodyPart(
            geometry: SCNSphere(radius: 0.08),
            position: SCNVector3(0.25, 0.4, 0),
            color: .systemYellow,
            name: "rightShoulder"
        )
        bodyContainer.addChildNode(rightShoulder)
        
        let leftArm = createBodyPart(
            geometry: SCNCylinder(radius: 0.05, height: 0.35),
            position: SCNVector3(-0.25, 0.15, 0),
            color: .systemTeal,
            name: "leftBicep"
        )
        bodyContainer.addChildNode(leftArm)
        
        let rightArm = createBodyPart(
            geometry: SCNCylinder(radius: 0.05, height: 0.35),
            position: SCNVector3(0.25, 0.15, 0),
            color: .systemTeal,
            name: "rightBicep"
        )
        bodyContainer.addChildNode(rightArm)
        
        let abs = createBodyPart(
            geometry: SCNBox(width: 0.35, height: 0.25, length: 0.18, chamferRadius: 0.03),
            position: SCNVector3(0, -0.1, 0),
            color: .systemGreen,
            name: "abs"
        )
        bodyContainer.addChildNode(abs)
        
        let leftLeg = createBodyPart(
            geometry: SCNCylinder(radius: 0.08, height: 0.5),
            position: SCNVector3(-0.12, -0.55, 0),
            color: .systemIndigo,
            name: "leftThigh"
        )
        bodyContainer.addChildNode(leftLeg)
        
        let rightLeg = createBodyPart(
            geometry: SCNCylinder(radius: 0.08, height: 0.5),
            position: SCNVector3(0.12, -0.55, 0),
            color: .systemIndigo,
            name: "rightThigh"
        )
        bodyContainer.addChildNode(rightLeg)
        
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
            
            gesture.setTranslation(.zero, in: gesture.view)
        }
        
        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let scene = sceneView?.scene,
                  let bodyNode = scene.rootNode.childNode(withName: "body", recursively: true) else {
                return
            }
            
            if gesture.state == .changed {
                let scale = gesture.scale
                currentScale *= scale
                currentScale = min(max(currentScale, 0.5), 2.0)
                
                bodyNode.scale = SCNVector3(currentScale, currentScale, currentScale)
                gesture.scale = 1.0
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
            case "neck": return .neck
            case "leftShoulder": return .leftShoulder
            case "rightShoulder": return .rightShoulder
            case "chest": return .chest
            case "leftBicep": return .leftBicep
            case "rightBicep": return .rightBicep
            case "abs": return .abs
            case "leftThigh": return .leftThigh
            case "rightThigh": return .rightThigh
            default: return nil
            }
        }
    }
}

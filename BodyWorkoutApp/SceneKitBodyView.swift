import SwiftUI
import SceneKit

struct SceneKitBodyView: UIViewRepresentable {
    @Binding var selectedBodyPart: BodyPart?
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = context.coordinator.createBodyScene()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor(Color(.systemGray6))
        sceneView.antialiasingMode = .multisampling4X
        
        // Add tap gesture
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        context.coordinator.sceneView = sceneView
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // Update if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedBodyPart: $selectedBodyPart)
    }
    
    class Coordinator: NSObject {
        @Binding var selectedBodyPart: BodyPart?
        var sceneView: SCNView?
        var bodyPartNodes: [String: SCNNode] = [:]
        
        init(selectedBodyPart: Binding<BodyPart?>) {
            _selectedBodyPart = selectedBodyPart
        }
        
        func createBodyScene() -> SCNScene {
            let scene = SCNScene()
            
            // Create camera
            let cameraNode = SCNNode()
            cameraNode.camera = SCNCamera()
            cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
            scene.rootNode.addChildNode(cameraNode)
            
            // Create ambient light
            let ambientLight = SCNNode()
            ambientLight.light = SCNLight()
            ambientLight.light?.type = .ambient
            ambientLight.light?.intensity = 500
            scene.rootNode.addChildNode(ambientLight)
            
            // Create directional light
            let directionalLight = SCNNode()
            directionalLight.light = SCNLight()
            directionalLight.light?.type = .directional
            directionalLight.light?.intensity = 1000
            directionalLight.position = SCNVector3(x: 5, y: 10, z: 10)
            scene.rootNode.addChildNode(directionalLight)
            
            // Build body
            buildBody(in: scene)
            
            return scene
        }
        
        func buildBody(in scene: SCNScene) {
            let bodyGroup = SCNNode()
            
            // HEAD
            let head = createBodyPart(.head, geometry: SCNSphere(radius: 0.6), position: SCNVector3(0, 5.5, 0))
            bodyGroup.addChildNode(head)
            
            // NECK
            let neck = createBodyPart(.neck, geometry: SCNCylinder(radius: 0.25, height: 0.4), position: SCNVector3(0, 4.9, 0))
            bodyGroup.addChildNode(neck)
            
            // SHOULDERS
            let leftShoulder = createBodyPart(.leftShoulder, geometry: SCNSphere(radius: 0.4), position: SCNVector3(-1.2, 4.5, 0))
            let rightShoulder = createBodyPart(.rightShoulder, geometry: SCNSphere(radius: 0.4), position: SCNVector3(1.2, 4.5, 0))
            bodyGroup.addChildNode(leftShoulder)
            bodyGroup.addChildNode(rightShoulder)
            
            // CHEST
            let chest = createBodyPart(.chest, geometry: SCNBox(width: 1.8, height: 1.2, length: 0.8, chamferRadius: 0.2), position: SCNVector3(0, 3.8, 0))
            bodyGroup.addChildNode(chest)
            
            // ABS
            let abs = createBodyPart(.abs, geometry: SCNBox(width: 1.6, height: 1.0, length: 0.7, chamferRadius: 0.2), position: SCNVector3(0, 2.5, 0))
            bodyGroup.addChildNode(abs)
            
            // HIPS
            let hips = createBodyPart(.hips, geometry: SCNBox(width: 1.7, height: 0.6, length: 0.8, chamferRadius: 0.2), position: SCNVector3(0, 1.7, 0))
            bodyGroup.addChildNode(hips)
            
            // LEFT ARM
            let leftBicep = createBodyPart(.leftBicep, geometry: SCNCapsule(capRadius: 0.25, height: 1.0), position: SCNVector3(-1.5, 3.7, 0))
            let leftForearm = createBodyPart(.leftForearm, geometry: SCNCapsule(capRadius: 0.22, height: 1.0), position: SCNVector3(-1.5, 2.4, 0))
            bodyGroup.addChildNode(leftBicep)
            bodyGroup.addChildNode(leftForearm)
            
            // RIGHT ARM
            let rightBicep = createBodyPart(.rightBicep, geometry: SCNCapsule(capRadius: 0.25, height: 1.0), position: SCNVector3(1.5, 3.7, 0))
            let rightForearm = createBodyPart(.rightForearm, geometry: SCNCapsule(capRadius: 0.22, height: 1.0), position: SCNVector3(1.5, 2.4, 0))
            bodyGroup.addChildNode(rightBicep)
            bodyGroup.addChildNode(rightForearm)
            
            // LEFT LEG
            let leftThigh = createBodyPart(.leftThigh, geometry: SCNCapsule(capRadius: 0.35, height: 1.5), position: SCNVector3(-0.5, 0.7, 0))
            let leftKnee = createBodyPart(.leftKnee, geometry: SCNSphere(radius: 0.3), position: SCNVector3(-0.5, -0.1, 0))
            let leftCalf = createBodyPart(.leftCalf, geometry: SCNCapsule(capRadius: 0.28, height: 1.3), position: SCNVector3(-0.5, -1.0, 0))
            let leftFoot = createBodyPart(.leftFoot, geometry: SCNBox(width: 0.4, height: 0.2, length: 0.7, chamferRadius: 0.1), position: SCNVector3(-0.5, -1.8, 0.2))
            bodyGroup.addChildNode(leftThigh)
            bodyGroup.addChildNode(leftKnee)
            bodyGroup.addChildNode(leftCalf)
            bodyGroup.addChildNode(leftFoot)
            
            // RIGHT LEG
            let rightThigh = createBodyPart(.rightThigh, geometry: SCNCapsule(capRadius: 0.35, height: 1.5), position: SCNVector3(0.5, 0.7, 0))
            let rightKnee = createBodyPart(.rightKnee, geometry: SCNSphere(radius: 0.3), position: SCNVector3(0.5, -0.1, 0))
            let rightCalf = createBodyPart(.rightCalf, geometry: SCNCapsule(capRadius: 0.28, height: 1.3), position: SCNVector3(0.5, -1.0, 0))
            let rightFoot = createBodyPart(.rightFoot, geometry: SCNBox(width: 0.4, height: 0.2, length: 0.7, chamferRadius: 0.1), position: SCNVector3(0.5, -1.8, 0.2))
            bodyGroup.addChildNode(rightThigh)
            bodyGroup.addChildNode(rightKnee)
            bodyGroup.addChildNode(rightCalf)
            bodyGroup.addChildNode(rightFoot)
            
            scene.rootNode.addChildNode(bodyGroup)
        }
        
        func createBodyPart(_ bodyPart: BodyPart, geometry: SCNGeometry, position: SCNVector3) -> SCNNode {
            let node = SCNNode(geometry: geometry)
            node.position = position
            node.name = bodyPart.rawValue
            
            // Material with gradient-like effect
            let material = SCNMaterial()
            material.diffuse.contents = UIColor(bodyPart.color)
            material.specular.contents = UIColor.white
            material.shininess = 0.5
            material.lightingModel = .phong
            
            geometry.materials = [material]
            
            bodyPartNodes[bodyPart.rawValue] = node
            
            return node
        }
        
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let sceneView = sceneView else { return }
            let location = gesture.location(in: sceneView)
            let hitResults = sceneView.hitTest(location, options: [:])
            
            if let hitNode = hitResults.first?.node,
               let partName = hitNode.name,
               let bodyPart = BodyPart(rawValue: partName) {
                
                // Haptic feedback
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                
                // Highlight animation
                highlightNode(hitNode)
                
                // Update selected body part
                DispatchQueue.main.async {
                    self.selectedBodyPart = bodyPart
                }
            }
        }
        
        func highlightNode(_ node: SCNNode) {
            let scaleUp = SCNAction.scale(to: 1.2, duration: 0.15)
            let scaleDown = SCNAction.scale(to: 1.0, duration: 0.15)
            let sequence = SCNAction.sequence([scaleUp, scaleDown])
            node.runAction(sequence)
        }
    }
}//
//  SceneKitBodyView.swift
//  BodyWorkoutApp
//
//  Created by Haseeb Ahmed on 05/02/2026.
//


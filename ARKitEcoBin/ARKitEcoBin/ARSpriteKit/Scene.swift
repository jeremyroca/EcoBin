//
//  Scene.swift
//  ARSpriteKit
//
//  Created by Esteban Herrera on 7/4/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
        
    let dechetLabel = SKLabelNode(text: "Dechéts")
    let nbrOfDechets = SKLabelNode(text: "0")
    let dechet = SKLabelNode(text: "Déchets triés : 0")
    let titre = SKLabelNode(text: "Apprenez à trier avec Eco'Bin")
    var creationTime : TimeInterval = 0
    var detritutCount = 0 {
        didSet{
            self.nbrOfDechets.text = "\(detritutCount)"
        }
    }
    
    var dechetCount = 0 {
        didSet{
            self.dechet.text = "Déchets triés : \(dechetCount)"
        }
    }
    
    
    
    override func didMove(to view: SKView) {
        dechetLabel.fontSize = 20
        dechetLabel.fontName = "DevanagariSangamMN-Bold"
        dechetLabel.color = .white
        dechetLabel.position = CGPoint(x: 40, y: 50)
        addChild(dechetLabel)
        
        titre.fontSize = 16
        titre.fontName = "DevanagariSangamMN-Bold"
        titre.color = .blue
        titre.position = CGPoint(x: 200, y: 650)
        addChild(titre)
        
        dechet.fontSize = 16
        dechet.fontName = "DevanagariSangamMN-Bold"
        dechet.color = .blue
        dechet.position = CGPoint(x: 200, y: 620)
        addChild(dechet)
        
        nbrOfDechets.fontSize = 30
        nbrOfDechets.fontName = "DevanagariSangamMN-Bold"
        nbrOfDechets.color = .white
        nbrOfDechets.position = CGPoint(x: 40, y: 10)
        addChild(nbrOfDechets)
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if currentTime > creationTime {
            createdechetAnchor()
            creationTime = currentTime + TimeInterval(randomFloat(min: 3.0, max: 6.0))
        }
    }
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    func createdechetAnchor(){
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        // Define 360º in radians
        let _360degrees = 2.0 * Float.pi
        
        // Create a rotation matrix in the X-axis
        let rotateX = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.0, max: 1.0), 1, 0, 0))
        
        // Create a rotation matrix in the Y-axis
        let rotateY = simd_float4x4(SCNMatrix4MakeRotation(_360degrees * randomFloat(min: 0.0, max: 1.0), 0, 1, 0))
        
        // Combine both rotation matrices
        let rotation = simd_mul(rotateX, rotateY)
        
        // Create a translation matrix in the Z-axis with a value between 1 and 2 meters
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1 - randomFloat(min: 0.0, max: 1.0)
        
        // Combine the rotation and translation matrices
        let transform = simd_mul(rotation, translation)
        
        // Create an anchor
        let anchor = ARAnchor(transform: transform)
        
        // Add the anchor
        sceneView.session.add(anchor: anchor)
        
        // Increment the counter
        detritutCount += 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch
        guard let touch = touches.first else {
            return
        }
        // Get the location in the AR scene
        let location = touch.location(in: self)
        
        // Get the nodes at that location
        let hit = nodes(at: location)
        
        // Get the first node (if any)
        if let node = hit.first {
            // Check if the node is a dechet (remember that labels are also a node)
            if node.name == "dechet1" {
                
                let killSound = SKAction.playSoundFileNamed("noir", waitForCompletion: false)
                
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                // Excecute the actions
                node.run(sequenceAction)
                
                // Update the counter
                detritutCount -= 1
                dechetCount += 1
            }
            
            if node.name == "dechet2" {
                
                let killSound = SKAction.playSoundFileNamed("jaune", waitForCompletion: false)
                
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                // Excecute the actions
                node.run(sequenceAction)
                
                // Update the counter
                detritutCount -= 1
                dechetCount += 1
            }
            
            if node.name == "dechet3" {
                
                let killSound = SKAction.playSoundFileNamed("vert", waitForCompletion: false)
                
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                // Excecute the actions
                node.run(sequenceAction)
                
                // Update the counter
                detritutCount -= 1
                dechetCount += 1
            }
            
            if node.name == "dechet4" {
                
                let killSound = SKAction.playSoundFileNamed("jaune", waitForCompletion: false)
                
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                // Excecute the actions
                node.run(sequenceAction)
                
                // Update the counter
                detritutCount -= 1
                dechetCount += 1
            }
            
            if node.name == "dechet5" {
                
                let killSound = SKAction.playSoundFileNamed("vert", waitForCompletion: false)
                
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                // Excecute the actions
                node.run(sequenceAction)
                
                // Update the counter
                detritutCount -= 1
                dechetCount += 1
            }
            
            if node.name == "dechet6" {
                
                let killSound = SKAction.playSoundFileNamed("noir", waitForCompletion: false)
                
                let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                let remove = SKAction.removeFromParent()
                
                // Group the fade out and sound actions
                let groupKillingActions = SKAction.group([fadeOut, killSound])
                // Create an action sequence
                let sequenceAction = SKAction.sequence([groupKillingActions, remove])
                
                // Excecute the actions
                node.run(sequenceAction)
                
                // Update the counter
                detritutCount -= 1
                dechetCount += 1
            }
            
            
        }
    }
}

//
//  Plane.swift
//  SkinCheck
//
//  Created by Bratislav Ljubisic on 1/18/18.
//  Copyright © 2018 Bratislav Ljubisic. All rights reserved.
//

import UIKit
import ARKit

class Plane: SCNNode {

    var planeGeometry: SCNBox?
    var anchor: ARPlaneAnchor?
    
    init(anchor: ARPlaneAnchor) {
        super.init()
        
        let width = CGFloat(anchor.extent.x)
        let length = CGFloat(anchor.extent.z)
        
        let planeHeight = 0.001 as CGFloat
        
        self.planeGeometry = SCNBox(width: width, height: planeHeight, length: length, chamferRadius: 0)
        
        let transparentMaterial = SCNMaterial()
        transparentMaterial.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
        
        self.planeGeometry?.materials = [transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial]
        
        let planeNode = SCNNode(geometry: planeGeometry)
        planeNode.position = SCNVector3(0, -planeHeight/2.0, 0)
        
        self.addChildNode(planeNode)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWith(_ anchor: ARPlaneAnchor) {
        self.planeGeometry?.width = CGFloat(anchor.extent.x)
        self.planeGeometry?.length = CGFloat(anchor.extent.z)
        
        self.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }
}

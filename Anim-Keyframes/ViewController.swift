//
//  ViewController.swift
//  Anim-Keyframes
//
//  Created by Mark Jeschke on 11/28/16.
//  Copyright © 2016 Mark Jeschke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shortSide = min(self.view.bounds.width, self.view.bounds.height)
        let longSide = max(self.view.bounds.width, self.view.bounds.height)
        
        // ===== Top Animation
        let topKeyframeVector = keyframesLayerFromAsset(assetName: "sample_logo",
                                                       repeatCount: 2,
                                                       loopForever: false,
                                                       x: shortSide / 4 + 25,
                                                       y: 20,
                                                       width: 100,
                                                       height: 100)
        // Add the animation layer to the view.
        self.view.layer.addSublayer(topKeyframeVector)
        
        // ===== Middle Animation
        let sVector = keyframesLayerFromAsset(assetName: "keyframes",
                                                       repeatCount: 3,
                                                       loopForever: false,
                                                       x: shortSide / 4,
                                                       y: longSide / 2 - shortSide / 4,
                                                       width: shortSide / 2,
                                                       height: shortSide / 2)
        // Add the animation layer to the view.
        self.view.layer.addSublayer(sVector)
        
        // ===== Bottom Animation
        let bottomKeyframeVector = keyframesLayerFromAsset(assetName: "sample_logo",
                                                       repeatCount: 0,
                                                       loopForever: true,
                                                       x: shortSide / 4 + 20,
                                                       y: longSide - 140,
                                                       width: 120,
                                                       height: 120)
        // Add the animation layer to the view.
        self.view.layer.addSublayer(bottomKeyframeVector)
        
    }
    
    // ===== Extract JSON data
    func loadVectorFromDisk(assetName:String) throws -> KFVector {
        let filePath : String = Bundle(for: type(of: self)).path(forResource: assetName, ofType: "json")!
        let data : Data = try String(contentsOfFile: filePath).data(using: .utf8)!
        let vectorDictionary : Dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
        
        return KFVectorFromDictionary(vectorDictionary)
    }
    
    // ===== Call the animation layer and pass in parameters
    func keyframesLayerFromAsset(assetName: String,
                                 repeatCount: Float,
                                 loopForever: Bool,
                                 x: CGFloat,
                                 y: CGFloat,
                                 width: CGFloat,
                                 height: CGFloat) -> KFVectorLayer {
        
        var myVector : KFVector!
        do {
            myVector = try loadVectorFromDisk(assetName: assetName)
            print("assetName: \(assetName)")
        } catch {
            print("Vector file could not be loaded, aborting")
        }
        
        let myVectorLayer = KFVectorLayer()
        myVectorLayer.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // For some reason setting a repeatCount = 0 doesn't work.
        if loopForever != true {
            myVectorLayer.repeatCount = repeatCount
        }
        myVectorLayer.faceModel = myVector!
        myVectorLayer.startAnimation()
        
        print("repeatCount: \(repeatCount)\n-----")
        
        return myVectorLayer
    }

}


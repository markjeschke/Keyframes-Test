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
        
        let sampleVector : KFVector!
        
        do {
            sampleVector = try self.loadSampleVectorFromDisk()
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }
        
        let sampleVectorLayer : KFVectorLayer = KFVectorLayer()
        
        let shortSide = min(self.view.bounds.width, self.view.bounds.height)
        let longSide = max(self.view.bounds.width, self.view.bounds.height)

        sampleVectorLayer.frame = CGRect(x: shortSide / 4, y: longSide / 2 - shortSide / 4, width: shortSide / 2, height: shortSide / 2)
        
        // Added repeatCount with a value of 1. But, it doesn't seem to affect its loop count, or stop it.
        sampleVectorLayer.repeatCount = 1
        
        // Attach the animation to the faceModel.
        sampleVectorLayer.faceModel = sampleVector!
        
        // Add the VectorLayer as a sublayer for the main view.
        self.view.layer.addSublayer(sampleVectorLayer)
        
        // Start the animation, which will loop by default.
        sampleVectorLayer.startAnimation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSampleVectorFromDisk() throws -> KFVector {
        let filePath : String = Bundle(for: type(of: self)).path(forResource: "keyframes", ofType: "json")!
        let data : Data = try String(contentsOfFile: filePath).data(using: .utf8)!
        let sampleVectorDictionary : Dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
        
        return KFVectorFromDictionary(sampleVectorDictionary)
    }

}


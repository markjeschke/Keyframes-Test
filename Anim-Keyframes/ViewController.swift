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
        
        let jsonDataExtractor = JsonDataExtractor()
        
        let shortSide = min(self.view.bounds.width, self.view.bounds.height)
        let longSide = max(self.view.bounds.width, self.view.bounds.height)
        
        // Top Keyframe animated logo
        let sampleLogoVector2 : KFVector!
        
        // Create animation from JSON date
        do {
            sampleLogoVector2 = try jsonDataExtractor.loadVectorFromDisk(assetName: "sample_logo")
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }
        
        let sampleLogoVectorLayer2 = KFVectorLayer()
        sampleLogoVectorLayer2.frame = CGRect(x: shortSide / 4, y: 20, width: shortSide / 2, height: shortSide / 2)
        sampleLogoVectorLayer2.repeatCount = 2
        sampleLogoVectorLayer2.faceModel = sampleLogoVector2!
        self.view.layer.addSublayer(sampleLogoVectorLayer2)
        sampleLogoVectorLayer2.startAnimation()
        
        let sampleVector : KFVector!
        do {
            sampleVector = try jsonDataExtractor.loadVectorFromDisk(assetName: "keyframes")
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }

        let sampleVectorLayer = KFVectorLayer()
        sampleVectorLayer.frame = CGRect(x: shortSide / 4, y: longSide / 2 - shortSide / 4, width: shortSide / 2, height: shortSide / 2)
        
        // The repeatCount parameter *MUST* be declared prior to the faceModel, and not after. Otherwise, the animation will not stop. If you want the animation to repeat indefinitely, just comment the following line out.
        sampleVectorLayer.repeatCount = 1
        
        // Attach the animation to the faceModel.
        sampleVectorLayer.faceModel = sampleVector!
        
        // Add the VectorLayer as a sublayer for the main view.
        self.view.layer.addSublayer(sampleVectorLayer)
        
        // Start the animation, which will loop by default.
        sampleVectorLayer.startAnimation()
        
        // Bottom Keyframe animated logo
        let sampleLogoVector : KFVector!
        do {
            sampleLogoVector = try jsonDataExtractor.loadVectorFromDisk(assetName: "sample_logo")
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }
        let sampleLogoVectorLayer = KFVectorLayer()
        sampleLogoVectorLayer.frame = CGRect(x: shortSide / 4, y: longSide - 180, width: shortSide / 2, height: shortSide / 2)
        sampleLogoVectorLayer.faceModel = sampleLogoVector!
        self.view.layer.addSublayer(sampleLogoVectorLayer)
        sampleLogoVectorLayer.startAnimation()
        
    }

}


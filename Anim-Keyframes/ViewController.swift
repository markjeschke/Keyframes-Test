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
        
        // Create JSON data extractor object for reuse
        let jsonDataExtractor = JsonDataExtractor()
        
        // Calculated dimensions, relating to the screen's dimensions
        let shortSide = min(self.view.bounds.width, self.view.bounds.height)
        let longSide = max(self.view.bounds.width, self.view.bounds.height)
        
        ///=============== Animate Keyframe logo on the top to be played twice
        
        // Top Keyframe animated logo
        let keyframeLogoVector : KFVector!
        
        // Create animation from JSON vector file.
        do {
            keyframeLogoVector = try jsonDataExtractor.loadVectorFromDisk(assetName: "sample_logo")
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }
        
        // Create vector layer
        let keyframeLogoVectorLayer = KFVectorLayer()
        
        keyframeLogoVectorLayer.frame = CGRect(x: shortSide / 4, y: 20, width: shortSide / 2, height: shortSide / 2)
        
        // The repeatCount parameter *MUST* be declared prior to the faceModel, and not after. Otherwise, the animation will not stop. If you want the animation to repeat indefinitely, just comment the following line out.
        keyframeLogoVectorLayer.repeatCount = 2
        
        // Attach the animation to the faceModel.
        keyframeLogoVectorLayer.faceModel = keyframeLogoVector!
        
        // Add the VectorLayer as a sublayer for the main view.
        self.view.layer.addSublayer(keyframeLogoVectorLayer)
        
        // Start animation halfway through.
        //keyframeLogoVectorLayer.seek(toProgress: 0.5) //<== Seek to Progress doesn't seem to work
        
        // Start the animation, which will loop by default.
        keyframeLogoVectorLayer.startAnimation()
        
        ///=============== Animate "S" Letter to be played once
        
        let sLetterVector : KFVector!
        do {
            sLetterVector = try jsonDataExtractor.loadVectorFromDisk(assetName: "keyframes")
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }

        let sLetterVectorLayer = KFVectorLayer()
        sLetterVectorLayer.frame = CGRect(x: shortSide / 4, y: longSide / 2 - shortSide / 4, width: shortSide / 2, height: shortSide / 2)
        sLetterVectorLayer.repeatCount = 1
        sLetterVectorLayer.faceModel = sLetterVector!
        self.view.layer.addSublayer(sLetterVectorLayer)
        sLetterVectorLayer.startAnimation()
        
        ///=============== Animate Keyframe logo on the bottom to be played infinitely
        
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
        sLetterVectorLayer.repeatCount = 0
        sampleLogoVectorLayer.faceModel = sampleLogoVector!
        self.view.layer.addSublayer(sampleLogoVectorLayer)
        sampleLogoVectorLayer.startAnimation()
        
    }

}


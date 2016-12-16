//
//  JsonDataExtractor.swift
//  Anim-Keyframes
//
//  Created by Mark Jeschke on 11/30/16.
//  Copyright © 2016 Mark Jeschke. All rights reserved.
//

import UIKit

class JsonDataExtractor: KFVector {
    
    /*
    
    var keyframesExtractor = KFVector()
    
    init(fileName:String, repeatCount:Float) {
        
        super.init()
    }
    
        /*
        // Create animation from JSON vector file.
        do {
            keyframesExtractor = try self.loadVectorFromDisk(assetName: fileName)
            print(keyframesExtractor)
            //let vectorLayer = KFVectorLayer()
            //vectorLayer.repeatCount = repeatCount
            //print("repeatCount: \(repeatCount)")
            
        } catch {
            print("Vector file could not be loaded, aborting")
            return
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func loadVectorFromDisk(assetName:String) throws -> KFVector {
        let filePath : String = Bundle(for: type(of: self)).path(forResource: assetName, ofType: "json")!
        let data : Data = try String(contentsOfFile: filePath).data(using: .utf8)!
        let vectorDictionary : Dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
        
        return KFVectorFromDictionary(vectorDictionary)
    }
    
    func keyframesLayerFromAsset(assetName:String, repeatCount:Float) -> KFVectorLayer {
        print("assetName: \(assetName)")
        
        // Create animation from JSON vector file.
        do {
            keyframesExtractor = try loadVectorFromDisk(assetName: assetName)
            print(keyframesExtractor)
            //let vectorLayer = KFVectorLayer()
            //vectorLayer.repeatCount = repeatCount
            //print("repeatCount: \(repeatCount)")
            
        } catch {
            print("Vector file could not be loaded, aborting")
            //return
        }
        
        let myVectorLayer = KFVectorLayer()
        myVectorLayer.repeatCount = repeatCount
        // Attach the animation to the faceModel.
        myVectorLayer.faceModel = keyframesExtractor
        myVectorLayer.startAnimation()
        
        return myVectorLayer
    }
 */

}
    


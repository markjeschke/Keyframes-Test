//
//  JsonDataExtractor.swift
//  Anim-Keyframes
//
//  Created by Mark Jeschke on 11/30/16.
//  Copyright © 2016 Mark Jeschke. All rights reserved.
//

import UIKit

class JsonDataExtractor: KFVector {
    
    func loadVectorFromDisk(assetName:String) throws -> KFVector {
        let filePath : String = Bundle(for: type(of: self)).path(forResource: assetName, ofType: "json")!
        let data : Data = try String(contentsOfFile: filePath).data(using: .utf8)!
        let vectorDictionary : Dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
        
        return KFVectorFromDictionary(vectorDictionary)
    }

}

//
//  Block.swift
//  BlockChain
//
//  Created by denzel banegas on 09/01/2021.
//

import UIKit

class Block {
    
    var hash:String!
    var data:String!
    var previousHash:String!
    var index:Int!
    
    // -> = returning type of...
    
    func generateHash() -> String{
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

//
//  Plan.swift
//  Savr
//
//  Created by William Robert Harrington on 2022-05-11.
//

import Foundation

struct Plan: Identifiable {
    
    let id: Int
    let name: String
    let income: Int
    let itemPrice: Int
    let percentSaved: Int
    
}

let examplePlan = Plan(id: 1, name: "Example Plan", income: 250,itemPrice: 1000, percentSaved: 50 )

let examplePlans = [
    
    Plan(id: 1, name: "Example Plan", income: 250, itemPrice: 1000, percentSaved: 50)
    
]


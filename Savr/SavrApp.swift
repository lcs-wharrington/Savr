//
//  SavrApp.swift
//  Savr
//
//  Created by William Robert Harrington on 2022-05-11.
//

import SwiftUI

@main
struct SavrApp: App {
    
    //MARK: Stored properties
    @State var plans: [Plan] = examplePlans
    
    var body: some Scene {
        WindowGroup {
                
            PlanListView(plans: $plans)
        }
    }
}

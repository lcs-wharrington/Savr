//
//  PlanListView.swift
//  Savr
//
//  Created by William Robert Harrington on 2022-05-11.
//

import SwiftUI

struct PlanListView: View {
    
    // MARK: Stored properties
    @Binding var plans: [Plan]

    @State var isNewPlanViewShowing = false
    
    
    // MARK: Computed properties
    
    var body: some View {
        
        NavigationView {
            
            List(plans) { currentPlan in
                
                Text(currentPlan.name)
                
                Text("\(currentPlan.income)")
                
                Text("\(currentPlan.itemPrice)")
                
                Text("\(currentPlan.percentSaved)")
                
                Text("You will acheve this goal in \(currentPlan.itemPrice/(currentPlan.income/currentPlan.percentSaved))")
                
                
            }
            .navigationTitle("My Plans")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    Button(action: {
                        
                        // Show the add plan view by setting the boolean to true
                        isNewPlanViewShowing = true
                        
                    }, label: {
                        
                        Text("Create New Plan")
                        
                    })
                }
            }
            // When "isNewPlanViewShowing" is true, the sheet is presented
            .sheet(isPresented: $isNewPlanViewShowing) {
                NewPlanView(plans: $plans,
                            isNewPlanViewShowing: $isNewPlanViewShowing)
            }
        }
    }
}

struct PlanListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PlanListView(plans: .constant(examplePlans))
        }
    }
}

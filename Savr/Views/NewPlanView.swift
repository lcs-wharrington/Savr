//
//  NewPlanView.swift
//  Savr
//
//  Created by William Robert Harrington on 2022-05-11.
//

import SwiftUI

struct NewPlanView: View {
    
    // MARK: Stored properties
    
    @Binding var plans: [Plan]

    @Binding var isNewPlanViewShowing: Bool
    
    @State var newPlanName = ""
    
    @State var newIncome: Int = 0
    
    @State var newItemprice: Int = 0
    
    @State var newPercentSaved: Int = 0
    
    // MARK: Computeded properties
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack{
                    
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    
                    VStack{
                        Text("What is the name of the item that you are saveing up for?")
                        TextField("Type something...", text: $newPlanName)
                    }
                }
                HStack{
                    
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.green)
                    
                    VStack {
                        Text("Whats your monthly income?")
                        TextField("Enter a number...", text: $newIncome)
                    }
                }
                
                HStack{
                    
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.red)
                    
                    VStack{
                        Text("How much does it cost?")
                        TextField("Enter a number...", text: $newItemprice)
                    }
                }
                
                HStack{
                    
                    Image(systemName: "square.and.arrow.down.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.blue)
                    
                    VStack{
                        Text("How much do you want to save per month?")
                        
                        Slider(value: $newPercentSaved,
                               in: 0.0...100.0,
                               label: {
                                    Text("Percent of saved monthy income")
                        },
                               minimumValueLabel: {
                                    Text("0")
                        },
                               maximumValueLabel: {
                                    Text("100")
                        })
                    }
                }
            }
            
            .navigationTitle("New Plan!")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button(action: {
                        
                        // Hide the view by setting the boolean back to false
                        isNewPlanViewShowing = false
                        
                        // Get an id that is one greater than the current maximum number of plans
                        let newId = plans.count + 1
                        
                        // Create the new Plan structure instance
                        let newPlan = Plan(id: newId, name: newPlanName, income: newIncome, itemName: newItemName, itemPrice: newItemprice, goalTime: newGoalTime)
                        
                        // New to the list of plans
                        plans.append(newPlan)
                        
                    }, label: {
                        
                        Text("Done")
                        
                    })
                    
                }
            }
            
        }
    }
}

struct NewPlanView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlanView(plans: .constant(examplePlans),
                    isNewPlanViewShowing: .constant(true))
    }
}

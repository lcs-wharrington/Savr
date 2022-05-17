//
//  OpeningView.swift
//  Savr
//
//  Created by William Robert Harrington on 2022-05-11.
//

import SwiftUI

struct OpeningView: View {
    
    // MARK: Stored properties
    
    @Binding var plans: [Plan]
    
    // Opacity
    @State var currentOpacity = 1.0
    //Rotation
    @State var repeatRotation = 0.0
    
    
    //MARK: Computed properties
    
    var body: some View {
        VStack{
            //Title
            Text("Savr")
                .font(Font.custom("futura-MediumItalic", size: 70))
            
            //Slogan
            Text("Save Your Saveings!")
                .font(Font.custom("futura-Medium", size: 20))
            
            NavigationLink(destination: {
                PlanListView(plans: $plans)
            }, label: {
                
                //Navigation Button
                Image(systemName: "chevron.forward.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.blue)
                    .rotation3DEffect(Angle.degrees(repeatRotation), axis: (x: 0, y: 0, z: 1))
                    .opacity(currentOpacity)
                    .padding()
                    .onTapGesture {
                        withAnimation(
                            Animation
                                .easeInOut(duration: 0.5)
                        ) {
                            // Spin the button
                            repeatRotation = 180
                            
                            //button fades out
                            currentOpacity = 0.0
                            
                        }
                    }
            })
            
            //Navigation Button
            Image(systemName: "chevron.forward.circle.fill")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.blue)
                .rotation3DEffect(Angle.degrees(repeatRotation), axis: (x: 0, y: 0, z: 1))
                .opacity(currentOpacity)
                .padding()
                .onTapGesture {
                    withAnimation(
                        Animation
                            .easeInOut(duration: 0.5)
                    ) {
                        // Spin the button
                        repeatRotation = 180
                        
                        //button fades out
                        currentOpacity = 0.0
                        
                    }
                }
        }
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}

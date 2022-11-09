//
//  LaunchSwiftUIView.swift
//  CapstoneProject
//
// Zawad Hossain
// this SwiftUi class holds the animtaion for the payment confirmation screen
//this class is then mapped to the corresponding launchviewcontroller
//it animates the HMS logo with a simple rotation

import SwiftUI

struct LaunchSwiftUIView: View {
    //state variables to check the state of the animation and rotation of the image
    @State private var isAnimating = true
    @State private var rotating = false
    
  
    var body: some View {
        ZStack{
// filles up the screen with color and takes up the entire space
            Color("logobg").ignoresSafeArea()
           
                
            VStack{
//checks for animation or not
//sets the animation
     if isAnimating{
                  
                Image("logo")
                        .frame(width: 250, height: 250)
                        .rotationEffect(Angle(degrees: rotating ? 360 : 0))
                       .animation( animation,value: rotating)
                       .transition(.opacity)
                       .onAppear{
                        self.rotating = true
                       }
                    
                    
                }
                
            }
            .animation(.default, value: isAnimating)
            .onAppear{changeStateVal()}
        }
        
        
        
        
    }
//adding a delay before stopping the animation
    func changeStateVal(){
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline:.now()+4){
            isAnimating = false
        }
    }
//adding the animation type
    var animation: Animation{
        Animation
            .easeInOut(duration: 1.25)
            .repeatForever(autoreverses: false)
            
    }
}


struct LaunchSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchSwiftUIView()
    }
}


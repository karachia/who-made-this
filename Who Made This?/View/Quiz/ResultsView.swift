//
//  ResultsView.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/12/22.
//

import SwiftUI

struct ResultsView: View {
    
    @State var score: Int
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray, Color.white, Color.white, Color.black]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("YOUR SCORE:")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    
                    Text("- \(score) -")
                        .font(.system(size: 90))
                        .italic()
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    
                    if self.score == 5 {
                        Text("Well Done!")
                            .font(.title)
                            .italic()
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.top)
                        
                        Text("You do know your composers!")
                            .font(.title2)
                            .italic()
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(2)
                            
                    } else if self.score == 3 || self.score == 4 {
                        Text("Not Bad!")
                            .font(.title)
                            .italic()
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.top)
                    } else {
                        Text("SHAME!")
                            .font(.title)
                            .italic()
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.top)
                        
                        Text("Your lack of culture disturbs me...")
                            .font(.title2)
                            .italic()
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(2)
                    }
                    
                    Spacer()
                    
            
                    NavigationLink {
                        HomeView()
                        
                    } label: {
                        Text("Done")
                             .font(.title3)
                             .bold()
                             .foregroundColor(.white)
                             .padding()
                             .frame(maxWidth: .infinity)
                    }
                        .padding()
                        .background(Color.black)
                        .padding(5)
                        .border(Color.black, width: 3)
                        .padding(.top)

                }
                .padding()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(score: 5)
    }
}

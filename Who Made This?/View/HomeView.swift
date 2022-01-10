//
//  HomeView.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import SwiftUI

var quiz: [Quiz] = []

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Do you know your composers?")
                    .font(.title)
                    .fontWeight(.heavy)
                    .italic()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.bottom)
            
               
                NavigationLink {
                    QuestionView(answer: composers[0], otherOptions: [composers[1], composers[2], composers[3]])
                } label: {
                   Text("Click Here to Start the Quiz!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black)
                .padding(5)
                .border(Color.black, width: 3)
                
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

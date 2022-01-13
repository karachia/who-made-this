//
//  HomeView.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import SwiftUI

struct HomeView: View {
//    @EnvironmentObject var modelData: ModelData
    
    func generateQuestions() -> Question {
        quiz.generateQuestions()
        return quiz.questions[0]
    }

    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray, Color.white, Color.white, Color.black]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Do you know your composers?")
                        .font(.title)
                        .fontWeight(.heavy)
                        .italic()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding()
                        .padding(.bottom)
            
                    NavigationLink {
                        QuestionView(question: self.generateQuestions(), score: 0)
                        
                    } label: {
                        Text("Click Here to Start the Quiz! ")
                             .font(.title3)
                             .bold()
                             .foregroundColor(.white)
                    }
                        .padding()
                        .background(Color.black)
                        .padding(5)
                        .border(Color.black, width: 3)
                    
                    Text(" ")
                        .padding(4)
                    
                    Text("Or")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .italic()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Text("Want to get cultured?")
                        .font(.title)
                        .fontWeight(.heavy)
                        .italic()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    NavigationLink {
                        LibraryView()
                    } label: {
                        Text("Click Here to Get Educated!")
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
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}

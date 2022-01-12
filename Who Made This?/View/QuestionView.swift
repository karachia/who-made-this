//
//  Question.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuestionView: View {
    @State var iconName: String = "play.fill"
    @State var isPlaying: Bool = false
    var question: Question
    private var answer: Composer? = nil
    private var workIndex: Int?
    private var otherOptions: [Composer] = []
    
    init(question: Question){
        self.question = question
        self.answer = question.answer
        self.workIndex = question.workIndex
        self.otherOptions = question.otherOptions
        
        if AudioPlayer.isPlaying() {
            AudioPlayer.stopMusic()
        }
    }
    
    
    func generateAllOptions() -> [QuizOption]{
        var allOptions: [QuizOption] = []
        allOptions.append(QuizOption(optionID: 0, composer: self.answer!))
        
        var i = 1
        for option in self.otherOptions{
            allOptions.append(QuizOption(optionID: i, composer: option))
            i += 1
        }
        return allOptions
    }
        
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack{
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white, Color.white, Color.white]), startPoint: .top, endPoint: .bottom))
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 200)
                    Spacer()
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray, Color.white, Color.white]), startPoint: .bottom, endPoint: .top))
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 200)
                }
                
            
                VStack{
                    Text("Who made this?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    Button(action: {
                        self.isPlaying.toggle()
                        if self.isPlaying {
                            self.iconName = "pause.fill"
                            
                            AudioPlayer.playMusic(fileName: (self.answer?.works[self.workIndex!].audioName)!)
                            
                        }
                        else {
                            self.iconName = "play.fill"
                            AudioPlayer.stopMusic()
                        }
                    }) {
                        Image(systemName: iconName)
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                        }
                    
                    Rectangle()
                        .frame(height: 1, alignment: .center)
                        .foregroundColor(.gray)
                        .padding(.top)
                        .padding(.bottom)

                    QuestionOptions(options: self.generateAllOptions())
                    
                    Spacer()
                    HStack{
                        Text("SCORE: 0/5")
                            .font(.title2)
                            .bold()
                            .italic()
                            .padding(.leading)
                        
                        Spacer()
                            
                    }
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                        HStack(alignment: .top){
                            NavigationLink {
                                if self.question.id < 4 {
                                    QuestionView(question: quiz.questions[self.question.id + 1])
                                }
                                else {
                                    HomeView()
                                }
                                                             
                            } label: {
                                Text("Next")
                                    .fontWeight(.semibold)
                                    .italic()
                                    .font(.title3)
                                    .padding(10)
                                    .frame(minWidth: 200, maxWidth: .infinity, minHeight: 30)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .border(Color.black, width: 3)
                                
                                }
                            }
        //                        .padding()
    //                            .background(Color.black)
    //                            .padding(5)
    //                            .border(Color.black, width: 3)
                            
                            
    //                        Button(action: {
    //                            print("hi")
    //                        }) {
    //                            Text("Next")
    //                                .fontWeight(.semibold)
    //                                .italic()
    //                                .font(.title3)
    //                                .padding(10)
    //                                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 30)
    //                                .background(Color.black)
    //                                .foregroundColor(.white)
    //                                .padding(5)
    //                                .border(Color.black, width: 3)
    //                        }
    //                    }
                        .padding()
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            question: Question(id: 0, answer: composers[0], workIndex: 0,
            otherOptions: [composers[1], composers[2], composers[3]],
            composersWorkNumber: 0))
    }
}

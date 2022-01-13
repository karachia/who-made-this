//
//  Question.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuestionView: View {
    @State private var iconName: String = "play.fill"
    @State private var isPlaying: Bool = false
    @State private var checked: Bool = false
    @State private var currentSelection: Int?
    @State private var currentComposerSelection: Int?
    @State private var checkClickedButNoOptionsSelected: Bool = false
    @State private var userAnsweredCorrectly: Bool = false
   
    
    var question: Question
    @State var score: Int
    
    private var answer: Composer? = nil
    private var workIndex: Int?
    private var options: [Composer] = []
    
    init(question: Question, score: Int){
        self.question = question
        self.answer = question.answer
        self.workIndex = question.workIndex
        self.options = question.options
        self.score = score
                
        if AudioPlayer.isPlaying() {
            AudioPlayer.stopMusic()
        }
    }
    
    
    func generateAllOptions() -> [QuizOption]{
        var allOptions: [QuizOption] = []
        var i = 0
        for option in self.options{
            let newOption: QuizOption = QuizOption(currentSelection: $currentSelection, currentComposerSelection: $currentComposerSelection, showResult: $checked, optionID: i, composer: option, answerComposerID: self.answer!.id)
            
            allOptions.append(newOption)
            
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
                    
                    let gridItemLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
                    LazyVGrid(columns: gridItemLayout, spacing: 10){
                        let options = self.generateAllOptions()
                        ForEach((0..<4), id: \.self) { i in
                            options[i]

                        }
                    }
                    
                    
                    Spacer()
                    if self.checkClickedButNoOptionsSelected{
                        Text("Select an option first!")
                            .font(.title3)
                            .foregroundColor(.red)
                            .bold()
                            .padding(.bottom)
                    }
                    HStack{
                        Text("SCORE: \(self.score)")
                            .font(.title2)
                            .bold()
                            .italic()
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("Question: \(self.question.id + 1)")
                            .font(.title2)
                            .bold()
                            .italic()
                            .padding(.trailing)
                            
                    }
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                        HStack(alignment: .top){
                            if checked {
                                NavigationLink {
                                    if self.question.id < 4 {
                                        QuestionView(question: quiz.questions[self.question.id + 1], score: self.score)
                                    }
                                    else {
                                        ResultsView(score: self.score)
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
                            
                            else {
                                Button(action: {
                                    // if no options selected, prompt the user to select one
                                    if self.currentSelection == nil || self.currentComposerSelection == nil {
                                        self.checkClickedButNoOptionsSelected = true
                                        print("no selections yet")
                                    }
                                    else
                                   {
                                       self.checked = true
                                       if self.answer?.id == self.currentComposerSelection {
                                           self.score += 1
//                                           self.total_score += 1
                                           self.userAnsweredCorrectly = true
                                        }
                                    }
                                }) {
                                    Text("Check")
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
                        }
                    }
                    .padding()
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
                               options: [composers[1], composers[2], composers[3]],
                               composersWorkNumber: 0), score: 0)
    }
}

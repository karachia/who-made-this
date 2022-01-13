//
//  Quiz.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import Foundation
import SwiftUI

struct Quiz {
    var questions: [Question] = []
//    var score: Int = 0
    

    mutating func generateQuestions () {
        // Generating 5 questions in an array of size 5
        // At each array position, we store the answer to the question by composer's id
        var listOfQuestioinsWithTheirAnswerAsComposerIDsForValues = (0...4).map({_ in Int.random(in: 0..<composers.count)})
        
        // Mix up the orders to make them a bit more random
        listOfQuestioinsWithTheirAnswerAsComposerIDsForValues.shuffle()
//        print("listOfQuestioinsWithTheirAnswerAsComposerIDsForValues: \(listOfQuestioinsWithTheirAnswerAsComposerIDsForValues)")
        
        // Now let's select a work from each question's composer's selection of works
        
        // in case there are more than one questions with the same composer as answer, we need to avoid selecting the same work for those questiosn.
        // using an auxilary data structure (dictionary) to make sure our work selections are always unique
        var mapOfAllQuestionsAndAnswers: [Int: [Int]] = [:]
        
        // initialzing the dict with empty arrays inside
        for idx in listOfQuestioinsWithTheirAnswerAsComposerIDsForValues {
            mapOfAllQuestionsAndAnswers[idx] = []
        }
        
        // For each question:
        //   * find a work for the questions answer (questions are multiple choice (4 options) with only one correct answer
        //   * generate the other 3 options
        for (counter, composerID) in listOfQuestioinsWithTheirAnswerAsComposerIDsForValues.enumerated(){
//            print("Looking at index \(composerID) which is \(composers[composerID].lastName)")
//            print("composer \(composers[idx].lastName)")
//            print("works # \(composers[idx].works.count)")
            
            // get a random work from this composer
            var indexOfMusicForComposer = Int.random(in: 0..<composers[composerID].works.count)
//            print("Initial work number for \(composers[composerID].lastName) idx: \(composerID) : \(indexOfMusicForComposer)")
            
            
            // if the music from this composer is already in the quiz, try to find another one
            while(mapOfAllQuestionsAndAnswers[composerID]!.contains(indexOfMusicForComposer)){
//                print("this work already exists in quiz...trying to get a new work")
                indexOfMusicForComposer = Int.random(in: 0..<composers[composerID].works.count)
            }
//            print("Final work number for \(composers[composerID].lastName) idx: \(composerID) : \(indexOfMusicForComposer)")
            mapOfAllQuestionsAndAnswers[composerID]!.append(indexOfMusicForComposer)
            
            
            // array that holds all the 4 options for each mutliple choice question.
            // First add the correct answer to options
            var options:  [Int] = [composerID]
//            print("options with just the answer: \(options)")
            
            // now find the other 3 options and make all options in the question are unique
            for _ in 0...2{
//                print("finding option \(j+2)")
                var optionIdx = Int.random(in: 0..<composers.count)
//                print("Initial composer option \(composers[optionIdx].lastName) optionIdx: \(optionIdx)")
                
                // make sure the selected option is unique
                while (options.contains(optionIdx)){
//                    print("option \(optionIdx) already exists. trying a new one")
                    optionIdx = Int.random(in: 0..<composers.count)
                }
//                print("Final composer option \(composers[optionIdx].lastName) optionIdx: \(optionIdx)")
                
                options.append(optionIdx)
            }
            
//            print("optioins before shuffle(): \(options)")
            // mix up the options so that the correct answer is not always the first option
            options.shuffle()
            
//            print("optioins after shuffle(): \(options)")
            
            // new add composers as options instead of just their ID
            var composerOptions: [Composer] = []
            
            for composerID in options {
                composerOptions.append(composers[composerID])
            }
            
            
            self.questions.append(Question(id: counter, answer: composers[composerID], workIndex: indexOfMusicForComposer, options: composerOptions, composersWorkNumber: indexOfMusicForComposer))
            
//            print("Q\(counter+1) answer is: \(composers[composerID].lastName)")
//            print("options for Q\(counter+1) are")
//            for o in composerOptions {
//                print("--- \(o.lastName)")
//            }
        }
    }
}

//
//  LibraryView.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/12/22.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray, Color.white, Color.white, Color.black]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Library")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    Spacer()
                    
                    ScrollView {
                        LibraryRowView(composer: composers[0])
                        LibraryRowView(composer: composers[1])
                        LibraryRowView(composer: composers[2])
                        LibraryRowView(composer: composers[3])
                        LibraryRowView(composer: composers[4])
                    }
                    
                    
                    
                    
                
                    
                    
                    
//                    Spacer()
                    
            
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
        .navigationBarBackButtonHidden(true)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

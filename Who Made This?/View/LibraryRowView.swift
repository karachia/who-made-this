//
//  LibraryRowView.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/12/22.
//

import SwiftUI

struct LibraryRowView: View {
    
    var composer: Composer?
    
    var body: some View {
//        NavigationView{
            VStack {
                NavigationLink {
                    ComposerPage(composer: self.composer)
                    
                } label: {
                    HStack{
                        CircleImage(image: self.composer!.image)
                            .frame(minWidth: 100, idealWidth: 120, maxWidth: 128, minHeight: 100, idealHeight: 120, maxHeight: 128)
                            .padding()
                        
                        Text(self.composer!.lastName)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                        
                    }
                }
            }
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
        
    }
}

struct LibraryRowView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryRowView(composer: composers[0])
    }
}

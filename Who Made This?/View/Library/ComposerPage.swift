//
//  ComposerPage.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/12/22.
//

import SwiftUI

struct ComposerPage: View {
    var composer: Composer?
    
    var body: some View {
        
        VStack{
            CircleImage(image: composer!.image)
                .frame(width: 200, height: 200, alignment: .center)
                .padding()
            
            Text(self.composer!.fullName)
                .font(.title)
                .padding(.top)
            
            Text(verbatim: "\(self.composer!.born) - \(self.composer!.death)")
                .bold()
                .padding(3)
            
            Rectangle()
                .frame(width:.infinity, height: 2)
                .foregroundColor(.black)
            
            Text(self.composer!.description)
                .font(.body)
                .italic()
            
            Spacer()
        }
        .padding(50)
    }
}

struct ComposerPage_Previews: PreviewProvider {
    static var previews: some View {
        ComposerPage(composer: composers[0])
    }
}

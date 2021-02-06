//
//  PostView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 1/17/21.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("template")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 10)
                VStack(alignment: .leading){
                    Text("John Doe")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(alignment: .topLeading)
                    Text("2h")
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
            .padding(.vertical, 5)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ornare blandit mauris, nec interdum purus pulvinar eu. Fusce commodo tortor a tempor posuere.")
                .padding(.top, -13)
                .padding([.leading, .bottom, .trailing], 5)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

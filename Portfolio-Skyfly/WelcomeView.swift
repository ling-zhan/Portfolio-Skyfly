//
//  WelcomeView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/3.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isView: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("welcome_bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Travel width comfort and safety!")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.trailing, 60)
                        .shadow(radius: 10)
                    Button(action: {
                        withAnimation(.linear) {
                            isView.toggle()
                        }
                    }, label: {
                        Text("Sign up")
                            .font(.title3).bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Capsule())
                    })
                }.frame(width: geometry.size.width, height: geometry.size.height / 2)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isView: .constant(true))
    }
}

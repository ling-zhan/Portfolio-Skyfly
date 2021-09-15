//
//  ContentView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/3.
//

import SwiftUI

struct ContentView: View {
    @State var isWelcomeView: Bool = true
    var body: some View {
        ZStack {
            if isWelcomeView {
                WelcomeView(isView: $isWelcomeView)
            }else {
                MainView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

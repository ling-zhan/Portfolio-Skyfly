//
//  MainView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/6.
//

import SwiftUI

struct MainView: View {
    @State var menuIndex: MenuType = .home
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    switch menuIndex {
                    case .home:
                        HomeView(geometry: geometry, menuIndex: $menuIndex)
                    case .favorite:
                        FavoriteView()
                    case .person:
                        PersonView()
                    default:
                        EmptyView()
                    }
                }
                VStack {
                    Spacer()
                    MenuTabView(geometry: geometry, selectedIndex: $menuIndex)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


enum MenuType {
    case home
    case favorite
    case person
}

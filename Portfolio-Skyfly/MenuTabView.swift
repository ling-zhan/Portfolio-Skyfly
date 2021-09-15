//
//  MenuTabView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/6.
//

import SwiftUI

struct MenuTabView: View {
    let geometry: GeometryProxy
    @Binding var selectedIndex: MenuType
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.2)
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .offset(x: 0, y: -1)
            HStack(spacing: 0) {
                TabBarIcon(geometry: geometry, iconName: "house.fill", tag: .home, selectedIndex: $selectedIndex)
                TabBarIcon(geometry: geometry, iconName: "heart.fill", tag: .favorite, selectedIndex: $selectedIndex)
                TabBarIcon(geometry: geometry, iconName: "person.fill", tag: .person, selectedIndex: $selectedIndex)
            }
            .frame(width: geometry.size.width, height: geometry.size.height/8)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}

struct MenuTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            MenuTabView(geometry: geometry, selectedIndex: .constant(.home))
        }
    }
}

struct TabBarIcon: View {
    let geometry: GeometryProxy
    let iconName: String
    let tag: MenuType
    @Binding var selectedIndex: MenuType
     
     var body: some View {
         VStack {
             Image(systemName: iconName)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width / 5, height: geometry.size.height / 28)
                 .padding(.top, 10)
                .foregroundColor(selectedIndex == tag ? Color.red : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
             Spacer()
         }.padding()
         .onTapGesture(perform: {
            withAnimation(.linear) {
                selectedIndex = tag
            }
         })
     }
 }

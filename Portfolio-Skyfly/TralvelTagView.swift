//
//  TralvelTagView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/6.
//

import SwiftUI

struct TralvelTagView: View {
    @Binding var tralvelTag: TralvelTag
    @Binding var searchText: String

    @Binding var gridPlaces: [Place]
    let places: [Place]
    
    let items: [TralvelTagItem] = tralvelTagItems
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<items.count) { index in
                    if index == 0 {
                        TagView(tralvelTagItem: items[index], tralvelTag: $tralvelTag, searchText: $searchText, gridPlaces: $gridPlaces, places: places)
                            .padding(.leading)
                    }else if index == items.count - 1 {
                        TagView(tralvelTagItem: items[index], tralvelTag: $tralvelTag, searchText: $searchText, gridPlaces: $gridPlaces, places: places)
                            .padding(.trailing)
                    }else {
                        TagView(tralvelTagItem: items[index], tralvelTag: $tralvelTag, searchText: $searchText, gridPlaces: $gridPlaces, places: places)
                    }
                }
            }
        })
    }
}

struct TralvelTagView_Previews: PreviewProvider {
    static var previews: some View {
        TralvelTagView(tralvelTag: .constant(.all), searchText: .constant(""), gridPlaces: .constant([]), places: placesData)
    }
}


struct TagView: View {
    let tralvelTagItem: TralvelTagItem
    @Binding var tralvelTag: TralvelTag
    @Binding var searchText: String
    @Binding var gridPlaces: [Place]
    let places: [Place]
    
    var body: some View {
        Text(tralvelTagItem.name)
            .foregroundColor( tralvelTag == tralvelTagItem.tag ? Color.white : Color.gray)
            .padding()
            .padding(.horizontal)
            .background( tralvelTag == tralvelTagItem.tag ? Color.red : Color(#colorLiteral(red: 0.9325749561, green: 0.9325749561, blue: 0.9325749561, alpha: 1)))
            .clipShape(Capsule())
            .onTapGesture(perform: {
                withAnimation(.spring()) {
                    tralvelTag = tralvelTagItem.tag
                    print(tralvelTag)
                    self.handleSelectedTagAction()
                }
            })
    }
    
    func handleSelectedTagAction() {
        if !searchText.isEmpty {
            gridPlaces = places.filter( {
                if $0.title.contains(searchText) && $0.tags.contains(tralvelTag) {
                    return true
                }
                return false
            })
        }else {
            gridPlaces = places.filter( {
                $0.tags.contains(tralvelTag)
            })
        }
    } // end func
}

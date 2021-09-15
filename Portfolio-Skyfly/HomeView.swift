//
//  HomeView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/3.
//

import SwiftUI

struct HomeView: View {
    let geometry: GeometryProxy
    
    @Binding var menuIndex: MenuType
    @State var searchText: String = ""
    @State var tralvelTag: TralvelTag = .all

    @State var places: [Place] = placesData
    @State var gridPlaces: [Place] = placesData
    @State var selectedPlace: Place = placesData.first!
    
    @State var tralvelTags:[TralvelTagItem] = []
    @State var selectedTag: TralvelTag?
    @State var isTicketView: Bool = false
    
    var body: some View {
        VStack {
            /* header */
            HStack {
                Text("Where would you linke to travel?")
                    .font(.title)
                Image("usercover")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }.padding()
            
            /* search */
            HStack {
                TextField("Search", text: $searchText)
                    .padding()
                    .onChange(of: searchText, perform: { value in
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
                    })
                Image(systemName: "line.horizontal.3.decrease.circle.fill")
                    .font(.title)
                    .padding()
            }
            .background(Color(#colorLiteral(red: 0.9325749561, green: 0.9325749561, blue: 0.9325749561, alpha: 1)))
            .cornerRadius(20)
            .padding()
            
            /* tag */
            TralvelTagView(tralvelTag: $tralvelTag, searchText: $searchText, gridPlaces: $gridPlaces, places: places)
            
            /* main */
            ScrollView(.vertical, showsIndicators: false, content: {
                PintersetGridView(gridPlaces: gridPlaces, numOfColumns: 2, selectedPlace: $selectedPlace, isTicketView: $isTicketView)
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(Color.clear)
            }).padding()
        } // end VStack
        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
        .fullScreenCover(isPresented: $isTicketView, content: {
            TicketView(selectedPlace: $selectedPlace, selectedTag: $selectedTag, tagItems: tralvelTags)
                .onAppear(perform: {
                    tralvelTags = []
                    for tags in selectedPlace.tags {
                        
                        let tag = tralvelTagItems.filter( {
                            if tags != .all {
                                return $0.tag == tags
                            }
                            return false
                        })
                        tralvelTags.append(contentsOf: tag)
                    }
                    selectedTag = tralvelTags.first?.tag
                })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            HomeView(geometry: geometry, menuIndex: .constant(.home))
        }
    }
}




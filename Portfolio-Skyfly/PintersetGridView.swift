//
//  PintersetGridView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/6.
//

import SwiftUI

struct PintersetGridView: View {
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    let columns: [Column]
    
    @Binding var selectedPlace: Place
    @Binding var isTicketView: Bool
    
    init(gridPlaces: [Place],
         numOfColumns: Int,
         spacing: CGFloat = 10,
         horizontalPadding: CGFloat = 10,
         selectedPlace: Binding<Place>,
         isTicketView: Binding<Bool>) {
        
        self._selectedPlace = selectedPlace
        self._isTicketView = isTicketView
        
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding

        var columns = [Column]()
        for _ in 0 ..< numOfColumns {
            columns.append(Column())
        }
        
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        for place in gridPlaces {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            columns[smallestColumnIndex].places.append(place)
            columnsHeight[smallestColumnIndex] += place.height
        } // end for
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing){
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.places) { place in
                        ZStack {
                            GeometryReader { geometry in
                                Image(place.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text(place.title)
                                            .font(.title3)
                                            .bold()
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("$\(place.tickets.first!.price)")
                                            .foregroundColor(.black)
                                            .padding(5)
                                            .padding(.horizontal, 5)
                                            .background(Color.white)
                                            .clipShape(Capsule())
                                    } // end HStack
                                }.padding()
                            } // end GeometryReader
                        } // end ZStack
                        .frame(height: place.height)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                        .onTapGesture(perform: {
                            self.selectedPlace = place
                            self.isTicketView.toggle()
                        })
                    } // end ForEach
                } // end LazyVStack
            } // end ForEach
        } // end HStack
    }
}

struct PintersetGridView_Previews: PreviewProvider {
    static var previews: some View {
        PintersetGridView(gridPlaces: placesData, numOfColumns: 2, selectedPlace: .constant(placesData.first!), isTicketView: .constant(false))
    }
}

//
//  TicketView.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/3.
//

import SwiftUI

struct TicketView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selectedPlace: Place
    @Binding var selectedTag: TralvelTag?
    let  tagItems: [TralvelTagItem]
    
    @State var tickets: [Ticket] = []
    
    @Namespace var animation
    
    init(selectedPlace: Binding<Place>, selectedTag: Binding<TralvelTag?>, tagItems: [TralvelTagItem]) {
        self._selectedPlace = selectedPlace
        self._selectedTag = selectedTag
        self.tagItems = tagItems
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(selectedPlace.imageName)
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)

                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.leading)
                            .onTapGesture(perform: {
                                presentationMode.wrappedValue.dismiss()
                            })
                        Spacer()
                    }.frame(width: geometry.size.width, height: geometry.size.height / 4, alignment: .top)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(tagItems) { item in
                                    TagView(geometry: geometry, animation: animation, tagItem: item, selectedTag: $selectedTag)
                                }
                            }
                            .padding(.top)
                        }.padding()
                        
                        Text("\(tickets.count) tickets")
                            .font(.title)
                            .bold()
                            .padding()
                        
                        ScrollView {
                            LazyVStack {
                                ForEach(tickets) { ticket in
                                    TicketItemView(ticket: ticket)
                                } // end foreach
                            }.padding(.bottom)
                        }
                        .onAppear(perform: {
                            tickets = []
                            self.tickets.append(contentsOf: self.selectedPlace.tickets.filter({
                                $0.tag == selectedTag
                            }))
                        })
                        .onChange(of: selectedTag, perform: { value in
                            tickets = []
                            self.tickets.append(contentsOf: self.selectedPlace.tickets.filter({
                                $0.tag == value
                            }))
                        })
                    }
                    .frame(width: geometry.size.width)
                    .background(Color(#colorLiteral(red: 0.9659001767, green: 0.9659001767, blue: 0.9659001767, alpha: 1)))
                    .cornerRadius(25)
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    } // end body
    
    struct TicketItemView: View {
        let ticket: Ticket
        var body: some View {
            VStack(spacing: 0) {
                VStack {
                    /* Header */
                    HStack {
                        Image(systemName: "circle")
                            .font(.headline)
                            .foregroundColor(.red)
                        VStack {
                            Divider()
                                .frame(height: 1)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.gray)
                        }

                        switch ticket.tag {
                        case .airline:
                            Image(systemName: "airplane")
                                .font(.headline)
                                .foregroundColor(.red)
                        case .train:
                            Image(systemName: "tram.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                        case .car:
                            Image(systemName: "car.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                        case .motorcycle:
                            Image(systemName: "circlebadge.2.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                        default:
                            Image(systemName: "circle")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
 
                        VStack {
                            Divider()
                                .frame(height: 1)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color.gray)
                        }
                        Image(systemName: "circle")
                            .font(.headline)
                            .foregroundColor(.black)
                    } // end HStack
                    
                    /* SubHeader */
                    HStack {
                        Text(ticket.fromLocation).font(.body)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text("\(Calendar.current.dateComponents([.hour], from: ticket.fromTime, to: ticket.toTime).hour!)h").font(.body).bold()
                        Text(ticket.toLocation).font(.body)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    /* Time */
                    HStack {
                        Text(ticket.fromTime, style: .time)
                            .font(.title3).bold()
                        Spacer()
                        Text(ticket.toTime, style: .time)
                            .font(.title3).bold()
                    }.padding(.top, 30)
                    
                    /* Date */
                    HStack {
                        Text(ticket.fromTime, style: .date)
                            .font(.body).foregroundColor(.gray)
                        Spacer()
                        Text(ticket.toTime, style: .date)
                            .font(.body).foregroundColor(.gray)
                    }.padding(.bottom, 30)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.horizontal, 20)
                
                HStack {
                    Text(ticket.title)
                    Spacer()
                    Text("$\(ticket.price)")
                }.padding().padding(.vertical)
                .background(Color.white)
                .cornerRadius(25)
            }.padding([.top, .horizontal])
        }
    }
    
    
    struct TagView: View {
        let geometry: GeometryProxy
        let animation: Namespace.ID
        
        let tagItem: TralvelTagItem
        @Binding var selectedTag: TralvelTag?
        
        var body: some View {
            ZStack {
                if selectedTag == tagItem.tag {
                    Capsule()
                        .frame(width: geometry.size.width / 4, height: 60)
                        .foregroundColor(.red)
                        .matchedGeometryEffect(id: "move", in: animation)
                }
                Text(tagItem.name)
                    .font(.title3).bold()
                    .foregroundColor(selectedTag == tagItem.tag ? .white : .black)
                    .frame(width: geometry.size.width / 4, height: 60)
            }
            .onTapGesture(perform: {
                withAnimation(.easeIn) {
                    selectedTag = tagItem.tag
                }
            })
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(selectedPlace: .constant(placesData.first!), selectedTag: .constant(nil), tagItems: tralvelTagItems)
    }
}




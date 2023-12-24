//
//  GalleryView.swift
//  Africa
//
//  Created by Sergiy Vergun on 25.10.2023.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30 ) {
                Image(selectedAnimal).resizable().scaledToFit().cornerRadius(20)
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                }
            }.padding(.horizontal,10)
                .padding(.vertical, 50 )
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

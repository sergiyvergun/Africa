//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Sergiy Vergun on 26.10.2023.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // MARK: IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // MARK: TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor.frame(height: 6)
                            .offset(y:24))
                // MARK: HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                // MARK: GALLERY
                Group {
                    HeadingView(image: "photo.stack", text: "Photo gallery")
                    
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                // MARK: FACTS
                Group{
                    HeadingView(image: "questionmark.circle", text: "Did you know?")
                    InsetFactView(animal: animal)
                }.padding(.horizontal)
                // MARK: DESCRIPTION
                Group{
                    HeadingView(image: "info.circle", text: "All about \(animal.name)")
                    Text(animal.description).multilineTextAlignment(.center)
                        .layoutPriority(1)
                    
                }.padding(.horizontal)
                // MARK: MAP
                Group{
                    HeadingView(image: "map", text: "National parks")
                    InsetMapView()
                    
                }.padding(.horizontal)
                // MARK: LINK
                Group{
                    HeadingView(image: "books.vertical", text: "Learn more")
                    ExternalWebLinkView(animal: animal)
                    
                }.padding(.horizontal)
                
                
            }
        }.navigationBarTitle("More about \(animal.name.lowercased())", displayMode: .inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[1])
        }.previewDevice("iPhone 12")
    }
}

//
//  InsetMapView.swift
//  Africa
//
//  Created by Sergiy Vergun on 11.12.2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        Text("Locations").foregroundColor(.accentColor).fontWeight(.bold)
                    }
                    .padding(.horizontal,14)
                    .padding(.vertical,10)
                    .background(Color.black.opacity(0.4).cornerRadius(8))
                }
                    .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
            .onAppear {
            MKMapView.appearance().mapType = .satellite
        }
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView().previewLayout(.sizeThatFits).padding()
    }
}

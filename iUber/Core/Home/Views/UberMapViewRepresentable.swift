//
//  UberMapViewrepResentable.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import Foundation
import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    @EnvironmentObject private var locationSearchVM: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let coordinate = locationSearchVM.selectedLocationCoordinate {
            print("DEBUG: Selected location in map view is \(coordinate)")
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
            context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}

extension UberMapViewRepresentable{
    class MapCoordinator: NSObject, MKMapViewDelegate{
        
        var userLocationCoordinate: CLLocationCoordinate2D?
        
        // MARK: - Properties
        let parent: UberMapViewRepresentable
        
        // MARK: - Lifecyle
        init(parent: UberMapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        // MARK: - MKMapViewDelegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: userLocation.coordinate.latitude,
                    longitude: userLocation.coordinate.longitude
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.05,
                    longitudeDelta: 0.05
                )
            )
            parent.mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .blue
            polyline.lineWidth = 6
            return polyline
        }
        
        // MARK: - Helpers
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute)-> Void){
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            let destinationPlacemark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: destinationPlacemark)
            
            let directions = MKDirections(request: request)
            
            directions.calculate { response, error in
                if let error = error {
                    print("DEBUG: Failed to get directions with error - \(error.localizedDescription)")
                    return
                }
                
                guard let route = response?.routes.first else {return}
                completion(route)
            }
        }
        
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D){
            guard let userLocationCoordinate = self.userLocationCoordinate else {return}
            getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
            }
        }
    }
}

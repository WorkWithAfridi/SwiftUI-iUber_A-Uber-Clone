//
//  LocationSearchViewModel.swift
//  iUber
//
//  Created by Khondakar Afridi on 1/8/24.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject{
    @Published var showSelectedLocation: Bool = false
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion){
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Search failed with \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else {return}
            let coordinate = item.placemark.coordinate
            
            self.selectedLocationCoordinate = coordinate
            
            print("DEGUB: Location coordiantes \(coordinate)")
        }
    }
    
    func locationSearch(
        forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
        completion: @escaping MKLocalSearch.CompletionHandler
    ){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
    
    // MARK: - Properties
    @Published var results = [MKLocalSearchCompletion]()
    private var searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet{
            print("DEBUG: Query fragment: \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
}


// MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}

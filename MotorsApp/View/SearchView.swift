//
//  SearchView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI
import SwifterSwift
import ActivityIndicatorView

struct SearchView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var carsListViewModel: CarsViewModel
    
    // Alert related objects
    @State var alertText: String = ""
    @State var alertDescription: String = ""
    
    // Loading indicator show / hide
    @State var showLoadingIndicator = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    
                    // The banner header with the company logo
                    HeaderComponent().padding(15)
                    Spacer()
                    
                    VStack {
                        
                        // HStack 1 ("Form element to enter the car make")
                        HStack {
                            Text("Make:").modifier(InLineTitleModifier())
                            Spacer()
                            Menu {
                                
                                Button {
                                    carsListViewModel.make = "Ford"
                                } label: {
                                    Text("Ford")
                                    Image("icnFord")
                                }
                                Button {
                                    carsListViewModel.make = "Nissan"
                                } label: {
                                    Text("Nissan")
                                    Image("icnNissan")
                                }
                                Button {
                                    carsListViewModel.make = "BMW"
                                } label: {
                                    Text("BMW")
                                    Image("icnBMW")
                                }
                                
                            } label: {
                                Text("Select").modifier(BodyTextLinkModifier())
                            }.frame(width: 50, height: 40, alignment: .leading)
                            TextField("",
                                      text: $carsListViewModel.make)
                            .modifier(PlaceholderStyleModifier(showPlaceHolder: carsListViewModel.make.isEmpty, placeholder: "...or type here"))
                            .frame(width: 200, height: 35, alignment: .trailing)
                            .modifier(CustomTextFieldModifier(text: $carsListViewModel.make))
                            .frame(width: 200, height: 40, alignment: .trailing)
                            .disableAutocorrection(true)
                            
                        } //: HStack 1
                        .padding(.leading, 10).padding(.trailing, 10)
                        
                        // HStack 2 ("Form element to enter the car model")
                        HStack{
                            Text("Model:").modifier(InLineTitleModifier())
                            Spacer()
                            TextField("",
                                      text: $carsListViewModel.model)
                            .modifier(PlaceholderStyleModifier(showPlaceHolder: carsListViewModel.model.isEmpty, placeholder: "enter model"))
                            .frame(width: 200, height: 35, alignment: .trailing)
                            .modifier(CustomTextFieldModifier(text: $carsListViewModel.model))
                            
                            .frame(width: 200, height: 40, alignment: .trailing)
                            .disableAutocorrection(true)
                            
                        } //: HStack 2
                        .padding(.leading, 10).padding(.trailing, 10)
                        
                        // HStack 2 ("Form element to enter the year of car registration")
                        HStack {
                            Text("Year (tap to change):").modifier(InLineTitleModifier())
                            
                            Picker(selection: $carsListViewModel.year) {
                                ForEach(2001...2022, id: \.self) { value in
                                    Text(String(value))
                                        .tag(value)
                                        //.font(.body)
                                }
                            } label: {
                                Text(String(carsListViewModel.year))
                                    .font(.body)
                            }
                            Spacer()
                        } //: HStack 3
                        .padding(.leading, 10).padding(.trailing, 10)
                        
                    } //: VStack
                    .padding()
                    .border(Color(UIColor.Theme.mainColor), width: 10.0)
                    .cornerRadius(2.0)
                    .padding(2)
                    
                    // Note to user about the restrictions of the API
                    Spacer()
                    Text("Please note that the test backend system can only accept numbers and letters as input, and can't take spaces!").font(Font(UIFont.Bold.size0))
                    Spacer()
                    
                    // Search Button
                    Button(action: searchButtonPressed) {
                        Text("Search")
                            .modifier(ButtonModifier())
                    } //: Search Button
                    .frame(width: 200, height: 40, alignment: .center)
                    .alert(isPresented: $carsListViewModel.showAlert) {
                        Alert(
                            title: Text(alertText),
                            message: Text(alertDescription),
                            dismissButton: .default(Text("OK")))
                    }      .onChange(of: carsListViewModel.showAlert) { newValue in
                        if newValue {
                            showLoadingIndicator.toggle()
                        }
                    }
                    
           
                    NavigationLink(destination: EmptyView()) {
                        EmptyView()
                    }
                    
                    // Using the technique of isActive on a navigation link
                    // for our segues (on device this is smooth)
                    NavigationLink(isActive: $carsListViewModel.requestSucceded) {
                        // pass in value only
                        ResultsView(cars: carsListViewModel.cars)
                    } label: {
                        EmptyView()
                    }
                    .onChange(of: carsListViewModel.requestSucceded) { newValue in
                        if newValue {
                            showLoadingIndicator = false
                        }
                    }
                    
                    
                    Spacer()
                    
                } //: VStack
                
                // Using a Z Stack lets us place an activity indicator on our
                // view whilst the API is queried and prior to our results view
                // being presented.
                ActivityIndicatorView(isVisible: $showLoadingIndicator,
                                      type: .rotatingDots(count: 3))
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(Color(UIColor.Theme.mainColor))
                
                
            } //: ZStack
            .navigationBarTitle(Text("Search"))
        }.navigationViewStyle(.stack)
        
    }
    
    
    /// Function called when the user taps the search button
    private func searchButtonPressed() {
        self.showLoadingIndicator = true
        if (self.carsListViewModel.make.count > 0 && self.carsListViewModel.model.count > 0) {
            if (self.carsListViewModel.make.isAlphabeticOrNumericOrBoth && self.carsListViewModel.model.isAlphabeticOrNumericOrBoth) {
                self.carsListViewModel.searchForCars()
            } else {
                alertText = "Input Character Restrictions!"
                alertDescription = "\nThe simple backend for this test only takes letters and numbers and is unable to accept spaces"
                carsListViewModel.showAlert.toggle()
            }
        } else {
            // Alert title "Please fill in all fields"
            alertText = "Fill in all Fields!"
            alertDescription = "\nPlease fill in all fields in the form."
            carsListViewModel.showAlert.toggle()
        }
    }
}

// MARK: - PREVIEW
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(CarsViewModel()).previewDevice("iPhone 5")
        
        SearchView().environmentObject(CarsViewModel()).previewDevice("iPhone 13 Pro Max")
    }
}

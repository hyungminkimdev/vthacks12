//
//  CountryView.swift
//  CultureTap
//
//  Created by Henry's Mac on 9/14/24.
//

import SwiftUI


struct CountryView: View {
    @ObservedObject var userProfile: UserProfile
    @State private var selectedCountry = "Germany 🇩🇪"
    
    let countries = [
        "United States 🇺🇸", "Canada 🇨🇦", "Germany 🇩🇪", "France 🇫🇷", "Netherlands 🇳🇱",
        "Japan 🇯🇵", "Australia 🇦🇺", "Brazil 🇧🇷", "China 🇨🇳", "India 🇮🇳", "Italy 🇮🇹", "Mexico 🇲🇽", "South Korea 🇰🇷",
        "New Zealand 🇳🇿", "Russia 🇷🇺", "South Africa 🇿🇦", "Spain 🇪🇸", "Sweden 🇸🇪", "Switzerland 🇨🇭",
        "Turkey 🇹🇷", "United Kingdom 🇬🇧"
        // Add more countries as needed
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Select your Country")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal)
            
            Picker("Country", selection: $selectedCountry) {
                ForEach(countries, id: \.self) { country in
                    Text(country)
                        .tag(country)
                        .foregroundStyle(Color.white)
                }
            }
            .frame(maxWidth: .infinity)
            .pickerStyle(.inline)
            .padding()
            .onChange(of: selectedCountry) { newValue in
                userProfile.country = newValue
            }
            
        }
        
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userProfile: UserProfile(name: "Hyungmin", age: 28, country: "Korea", hobbies: "Reading", mbti: "ESFJ", funFacts: "Likes coding"))
    }
}

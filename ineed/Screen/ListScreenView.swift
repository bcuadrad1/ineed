import Foundation
import SwiftUI

struct Client: Identifiable {
    var id = UUID()
    var name: String
    var telephone: Int
    var direction: String
}

struct ClientList {
    static let all = [
        Client(name: "Edwin", telephone: 333333333, direction: "calle 7 de diciembre - Sabana Grande "),
        Client(name: "Cristian", telephone: 333333332, direction: "por el Parque - Soledad "),
        Client(name: "Bry", telephone: 3045421621, direction: "Solitud")
    ]
}

struct Business: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var telephone: String
    var img: String
    var stars: Int
    var category: Category
}

enum Category: String {
    case health = "Health"
    case home = "Home Needs"
    case style = "Life Style"
}

struct BusinessesList {
    static let all  = [
        Business(name: "Need nails", description: "get your nails done!. professional, top, and fashionist.", telephone: "3045421621", img: "nail", stars: 0, category: .style),
        Business(name: "Plumber", description: "got a leak?, plumber 24 Hours. synk, dishwasher, toilet and all kind", telephone: "3045421621", img: "plumber", stars: 4, category: .home),
        Business(name: "FIXAQUA - Barranquilla", description: "more than 25 years in the bussiness", telephone: "3045421621", img: "plumber", stars: 5, category: .home),
        Business(name: "Piscinas", description: "cleaning pool's since 1966", telephone: "3045421621", img: "pool", stars: 5, category: .home),
        Business(name: "Vikings look", description: "best haircuts looks for men", telephone: "3045421621", img: "barber_shop", stars: 5, category: .style),
        Business(name: "Makeupme Over", description: "MakeUp experts, for all kind of events", telephone: "3045421621", img: "makeup", stars: 5, category: .style),
        Business(name: "MB Cejas Y Pestañas", description: "Microblading for thickert eye brows, lashes all kind, shape and color", telephone: "3045421621", img: "makeup", stars: 5, category: .style),
        Business(name: "Barber", description: "this is a description", telephone: "3045421621", img: "barber_shop", stars: 0, category: .style)
    ]
}

struct ListScreenView: View {
    @State var searchText = ""
    @State var businessFromWeb: [Business] = []
    
    var clients = ClientList.all
    
    var businesses: [Business] {
        if searchText.isEmpty {
            return BusinessesList.all
        } else {
            return BusinessesList.all.filter { business in
                let containsName = business.name.lowercased().contains(searchText.lowercased())
                let containsDescription = business.description.lowercased().contains(searchText.lowercased())

                return containsName || containsDescription
            }
        }
    }
    
    var body: some View {
        List(businesses, id: \.id) { business in
            NavigationLink(destination: BusinessDetailView(business: business)) {
                HStack {
                    Image(business.img)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(12)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(business.name)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .font(.system(size: 16))
                        Text(business.description)
                            .fontWeight(.light)
                            .foregroundColor(.secondary)
                            .font(.system(size: 14))
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "iNeed")

    }
}

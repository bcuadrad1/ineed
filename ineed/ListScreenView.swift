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

//        if searchText.isEmpty {
//            return businessFromWeb
//        } else {
//            return businessFromWeb.filter { business in
//                let containsName = business.name.lowercased().contains(searchText.lowercased())
//                let containsDescription = business.description.lowercased().contains(searchText.lowercased())
//
//                return containsName || containsDescription
//            }
//        }
    }
    
    var body: some View {
        let a = print("==========> ")
        
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
        .onAppear{
            let a = print("is appearing")
        }
        .onDisappear{
            let a = print("is dissssssapearing")
        }
        .task {
            let a = print("is a task")
        }
//        .onAppear {
//            let url = URL(string: "https://96b7-186-112-204-119.ngrok.io/business/api/list")!
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    print("error: \(error)")
//                }
//
//                guard let data = data else {
//                    print("error on data: \(error)")
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    let response = String(data: data, encoding: .utf8)!
//                    let data = response.data(using: .utf8)
//                    let json = try! JSONSerialization.jsonObject(with: data! as Data, options: [])
//                    let dict = json as! [[String: Any]]
//
//                    for item in dict {
//                        let phone = item["phone"] as! String
//                        let business = Business(name: item["name"] as! String, description: item["description"] as! String, telephone: item["phone"] as! String, img: item["img"] as! String, stars: 5, category: .home)
//
//                        self.businessFromWeb.append(business)
//                    }
//                }
//            }.resume()
//        }

    }
}

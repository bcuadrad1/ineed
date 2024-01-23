import SwiftUI

struct Popular {
    var id = UUID()
    var name: String
    var image: String
}

struct LandScreenView: View {    
    var popularSearchs =  [
        Popular(name: "style", image: "style"),
        Popular(name: "health", image: "health"),
        Popular(name: "home needs", image: "home_need")
    ]
    
    var top5Business: [Business] {
        var top5: [Business] = []
        for business in BusinessesList.all where business.stars == 5 {
            top5.append(business)
        }
        return top5
    }
    
    var gridColumn: [GridItem] {
        [GridItem(.adaptive(minimum: 100))]
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(14)
            
            LazyVGrid(columns: gridColumn) {
                ForEach(popularSearchs, id: \.id) { search in
                    VStack(){
                        Image(search.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(12)
                        Text(search.name)
                            .textCase(.uppercase)
                            .font(.system(size: 14))
                            .fontWeight(.light)
                    }
                }
            }
            
            Text("Top 5 Businesses")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(14)
            
            List(top5Business, id: \.id) { business in
                HStack {
                    Image(business.img)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .cornerRadius(10)
                        .padding(.trailing)
                    VStack(alignment: .leading, spacing: 2) {
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
            .listStyle(PlainListStyle())

            Spacer()
        }
    }
}



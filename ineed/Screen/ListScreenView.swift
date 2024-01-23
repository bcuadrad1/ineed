import Foundation
import SwiftUI

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

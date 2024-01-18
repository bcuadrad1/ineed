import SwiftUI

struct BusinessDetailView: View {
    var business: Business
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            
            Image(business.img)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .cornerRadius(12)
            
            Text(business.name)
                .font(.system(size: 26))
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text(business.description)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .fontWeight(.light)
            
            HStack {
                Label("from 8:00 Am to 6:00 Pm", systemImage: "book.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 18)
                
                Spacer()
            }
            
            Spacer()
            
            Button(action: {
                let phone = "tel://"
                let phoneNumberformatted = phone + business.telephone
                guard let url = URL(string: phoneNumberformatted) else { return }
                UIApplication.shared.open(url)
               }) {
                   Label("", systemImage: "phone.fill")
                       .fontWeight(.semibold)
                       .font(.system(size: 30))
                       .padding()
               }
               .background(Color(.systemGreen))
               .foregroundColor(.white)
               .cornerRadius(110)
        }
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(business: BusinessesList.all.first!)
    }
}

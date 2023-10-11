import SwiftUI

struct HeroView: View {
    private let tracking: CGFloat = -4
    

    var body: some View {
        Image("logo_color")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 28, alignment: .center)
            .padding(.top, 8)
        VStack(alignment: .leading, spacing: -32) {
            Text("AUTHBLUE")
                .tracking(self.tracking)
                .foregroundStyle(
                    .linearGradient(
                        colors: [Color("Blue"), Color("Purple")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            Text("Sample")
                .tracking(self.tracking)
                .padding(.top, 16)
                .foregroundColor(Color.black)
            Text("App")
                .tracking(self.tracking)
                .padding(.top, 16)
                .foregroundColor(Color.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.custom("SpaceGrotesk-Medium", size: 64))
    }
}


struct PrimaryButtonStyle: ButtonStyle {
    private let padding: CGFloat = 8

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .semibold))
            .padding(.init(top: self.padding,
                           leading: self.padding * 6,
                           bottom: self.padding,
                           trailing: self.padding * 6))
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

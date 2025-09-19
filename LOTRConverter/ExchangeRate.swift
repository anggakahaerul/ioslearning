import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource

    var body: some View {

        HStack {
            //we just want to show the image, so we never change it
        //image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(width: 25);
            //exchange rate text
            Text(text);

                // right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(width: 25)
        }
    }
}


#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
    //instance of our exchange rate view.
}

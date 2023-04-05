//
//  ZodiacViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

struct Horoscope {
    var name: String
    var date: String
    var description: String
}

class ZodiacViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage3: UIImageView!
    
    @IBOutlet weak var ariesButton: UIButton!
    @IBOutlet weak var taurusButton: UIButton!
    @IBOutlet weak var geminiButton: UIButton!
    @IBOutlet weak var cancerButton: UIButton!
    @IBOutlet weak var leoButton: UIButton!
    @IBOutlet weak var virgoButton: UIButton!
    @IBOutlet weak var libraButton: UIButton!
    @IBOutlet weak var scorpioButton: UIButton!
    @IBOutlet weak var sagittariusButton: UIButton!
    @IBOutlet weak var capricornButton: UIButton!
    @IBOutlet weak var aquariusButton: UIButton!
    @IBOutlet weak var piscesButton: UIButton!
    
    var horoscopes: [Horoscope] = [
        Horoscope(name: "Cung Bạch Dương",
                  date: "21/3 - 20/4",
                  description: "  - Cung Bạch Dương có tên tiếng Anh là Aries, có con số may mắn là 1 và 9. \n - Màu sắc may mắn của những người thuộc cung này màu đỏ. \n - Đây là màu của máu và lửa nên những người thuộc cung Bạch Dương thường có tính cách năng động, nhiệt huyết cả trong cuộc sống và công việc.\n - Cung Bạch Dương đại diện cho sao Hỏa và là cung đầu tiên thuộc nhóm nguyên tố Lửa trong 12 cung hoàng đạo. Những chàng trai, cô gái thuộc cung này thường có xu hướng thiếu kiên nhẫn, mạnh mẽ và có tài năng lãnh đạo. Chính vì thế, Bạch Dương thường không làm theo lời khuyên của người khác khi những lời nói đó có thể làm cản trở mục đích ban đầu.\n - Cung Hoàng Đạo Bạch Dương và tình yêu \n   Bạch Dương có nét thu hút rất quyến rũ cùng tính cách lạc quan, yêu đời nên được “người người, nhà nhà” yêu mến. Tuy nhiên, những người thuộc cung này thường có xu hướng kết đôi với những người có cùng “tần số” với họ. Trong tình yêu, Bạch Dương thường thể hiện tình cảm nồng nhiệt với người yêu và chiều chuộng họ. Cung Bạch Dương sẽ hợp với Sư Tử, Song Tử hay Thần Nông."),
        Horoscope(name: "Cung Kim Ngưu",
                  date: "21/4 - 20/5",
                  description: " - Cung Kim Ngưu có tên gọi tiếng anh là Taurus. \n - Đây là một trong các cung hoàng đạo thuộc nhóm Đất. \n - Con số may mắn của cung này là số 2 và số 8. Màu sắc giúp thu hút điềm may cho hội những người thuộc cung Kim Ngưu là màu hồng và xanh lục. Kim Ngưu đại diện cho sao Kim. Hầu hết người thuộc cung này đều có nét tính cách ôn hòa.\n - Tính cách bạn nam Cung Kim Ngưu\n   Bạn nam Kim Ngưu yêu thích lối sống truyền thống nên tính cách có phần hơi cứng nhắc. Tuy nhiên, đây chính là tuýp người “trong nóng, ngoài lạnh” khi những chàng trai thuộc cung này rất biết cách quan tâm người khác.\n - Tính cách bạn nữ Cung Kim Ngưu.\n    Những bạn gái thuộc cung Kim Ngưu có vẻ ngoài cá tính, rất trọng tình nghĩa và thường có năng khiếu về nghệ thuật. Họ luôn can đảm đối mặt với thử thách và không dễ bị khuất phục.\n - Cung Hoàng Đạo Kim Ngưu và tình yêu\n    Trong tình yêu, cả nam và nữ Kim Ngưu đều khá chu đáo và tinh tế. Một khi đã trao trái tim cho ai đó thì họ sẵn sàng làm tất cả để bảo vệ tình yêu của mình đến cùng. Kim Ngưu biết cách chăm sóc người yêu và giỏi lắng nghe nên tình yêu của họ thường bền lâu. Cung hoàng đạo này hợp với cung Xử Nữ và Ma Kết."),
        Horoscope(name: "Cung Song Tử ",
                  date: "21/5 - 21/6",
                  description: " - Cung Song Tử là cái tên tiếp theo trong 12 cung hoàng đạo thuộc nguyên tố Khí.\n - Cung hoàng đạo này có tên gọi trong tiếng anh là Gemini. Xanh lá cây hay xanh da trời là các tone màu có thể giúp Song Tử gặp nhiều may mắn. \n - Song Tử đại diện cho sao Thủy và có con số giúp mang đến vận may là 3, 4 và 7. \n  - Tính cách bạn nam Cung Song Tử \n   Những bạn nam thuộc cung này thường có vẻ ngoài năng động và tự tin. \n   Họ cũng là những người biết cách chăm chuốt cho vẻ ngoài và luôn xuất hiện với sự hào nhoáng. Song Tử nam rất giỏi ăn nói nên được lòng nhiều người. Họ cũng biết cách sống hòa đồng và thân thiện.\n -  Tính cách bạn nữ Cung Song Tử \n    Nữ Song Tử là những cô gái cực kỳ hào phóng và sòng phẳng. Họ sống rất tình cảm, lãng mạn, biết cách quan tâm đến những người xung quanh mình. Ngoài ra, bạn nữ thuộc cung này còn khá hài hước và vui vẻ. \n - Cung Hoàng Đạo Song Tử và tình yêu\n     Song Tử là kiểu người thích được quan tâm và luôn đặt gia đình, người yêu và bạn bè lên hàng đầu nên họ thường thể hiện tình cảm của mình rất nồng nhiệt. Họ thường bị cuốn hút bởi những người thú vị và có cùng sở thích với họ. Họ sẽ hợp yêu đương với cung Thiên Bình hoặc Bảo Bình."),
        Horoscope(name: "Cung Cự Giải",
                  date: "22/06 - 22/07",
                  description: " - Cự Giải được biết đến là một trong các cung hoàng đạo thuộc nguyên tố Khí nên thường có nét tính cách khó hiểu, “sáng nắng, chiều mưa”. \n - Tên tiếng Anh của cung hoàng đạo này là Cancer. Những người thuộc cung này hợp với màu xám, bạc hay trắng. \n - Con số may mắn của Cự Giải là 4 và 6. Cự Giải đại diện cho Mặt Trăng và có hình ảnh biểu tượng là hình con Cua. \n - Tính cách bạn nam Cung Cự Giải \n   Nam Cự Giải nổi tiếng với tính cách ấm áp, đa tài, ít nói và sống khá “khép kín”. Họ cũng là những người thể hiện quan điểm rõ ràng, rạch mạch trong mọi chuyện nhưng đôi khi hơi cứng đầu, không thích lắng nghe ý kiến từ mọi người xung quanh. \n - Tính cách bạn nữ Cung Cự Giải \n   Nữ Cự Giải là cô gái mơ mộng, có hoài bão, lý tưởng và luôn cố gắng hết mình để đạt được thành công. Các bạn nữ thuộc cung này cũng rất dịu dàng, sẵn sàng giúp đỡ mọi người xung quanh mình.\n -  Cung Hoàng Đạo Cự Giải và tình yêu \n   Cự Giải rất chân thành khi yêu và đối xử thật lòng, chung thủy với người mình yêu. Khi phải lòng một ai đó, họ không ngại dành thời gian để yêu thương và chăm sóc người yêu của mình. Vì họ khá ít nói nên có xu hướng bị thu hút bởi những cung hoàng đạo năng động và hoạt bát, chẳng hạn như Thiên Bình hay Bạch Dương."),
        Horoscope(name: "Cung Sư Tử",
                  date: "23/07 - 22/08",
                  description: " - Một trong 12 cung hoàng đạo thuộc nguyên tố Lửa có tính cách năng động, hoạt bát đó chính là cung Sư Tử. \n - Tên tiếng anh của cung này là Leo. Cung Sư Tử đại diện cho mặt trời, có con số may mắn là 1, 4 và 6. Những người thuộc cung này sẽ phù hợp với màu đỏ, vàng và cam.Hình ảnh biểu tượng của cung này chính là chú sư tử có vẻ ngoài uy nghi, ra dáng “chúa tể sơn lâm”. \n - Tính cách bạn nam Cung Sư Tử\n    Bạn nam Sư Tử là những người rất rộng lượng,hào phóng, cũng rất tham vọng và tự tin. Họ luôn hết mình vì gia đình, bạn bè và người yêu. Họ có khả năng lãnh đạo giỏi và một sức hút rất đặc biệt nên luôn trở thành tâm điểm giữa đám đông. \n - Tính cách bạn nữ Cung Sư Tử \n   Nữ Sư Tử thường có vẻ ngoài cuốn hút, khiến mọi người ấn tượng ngay từ lần đầu gặp gỡ. Họ rất kiên định, một khi đã quyết định một việc gì đó thì sẽ theo đuổi đến cùng. Những bạn nữ thuộc cung này rất độc lập, không thích phụ thuộc vào bất kỳ ai. \n - Cung Hoàng Đạo Sư Tử và tình yêu\n     Cung Sư Tử thường thích kiểm soát và nắm thế chủ động trong tình yêu. Họ rất biết cách chiều chuộng người mình yêu, tạo cảm giác an toàn cho đối phương. Những người thuộc cung này dễ bị thu hút bởi tuýp người thông minh, thú vị và hơi “bí ẩn” một chút, điển hình như Kim Ngưu hay Bọ Cạp."),
        Horoscope(name: "Cung Xử Nữ ",
                  date: "23/08 - 22/09",
                  description: " - Cung Xử Nữ là một trong các cung hoàng đạo thuộc nhóm Đất. Xử Nữ đại diện cho sao Thủy, có con số may mắn là 2, 5 và 7.\n -  Màu sắc may mắn của cung này đó là những gam màu nhạt như bạc hay các tone màu lung linh. Xử Nữ có tên gọi tiếng anh là Virgo và hầu hết những người thuộc cung này đều có tính cách cầu toàn. \n - Tính cách bạn nam Cung Xử Nữ\n    Bạn nam thuộc cung Xử Nữ có tính cách “hướng nội”, thường khá trầm tính và ít nói. Đôi khi họ cũng có phần hơi gia trưởng và thích kiểm soát. Tuy nhiên, trong công việc, Xử Nữ nam rất có trách nhiệm, luôn hoàn thành nhiệm vụ được giao một cách xuất sắc nhất. \n - Tính cách bạn nữ Cung Xử Nữ\n    Những bạn nữ thuộc cung Xử Nữ thường rất cầu toàn. Họ không thích mạo hiểm và hiếm khi muốn thay đổi để trải nghiệm những điều mới mẻ. Dù vậy, họ là những cô gái ngọt ngào, biết cách lắng nghe và quan tâm người khác.\n -  Cung Hoàng Đạo Xử Nữ và tình yêu \n   Trong tình yêu, Xử Nữ là tuýp người kiệm lời, ít nói, chỉ thích dùng hành động để chứng minh tình cảm của mình. Họ có trực giác nhạy bén, không thích bị kiểm soát. Rất khó để có thể nắm bắt và hiểu tâm tư của cung hoàng đạo này. Xử Nữ thích những người năng động và có vẻ ngoài sáng, họ phù hợp với cung Nhân Mã và Song Tử."),
        Horoscope(name: "Cung Thiên Bình",
                  date: "23/09 - 22/10",
                  description: " - Cung Thiên Bình thuộc nguyên tố Khí, có hình ảnh biểu tượng là “cán cân công lý”. Trong tiếng Anh, cung Thiên Bình có tên gọi khác là Libra.\n - Thiên Bình đại diện cho sao Kim, có màu sắc may mắn là màu xanh lá và con số may mắn là 1, 2 và 7. Cung Thiên Bình được biết đến là một trong 12 cung hoàng đạo lãng mạn nhất. \n - Tính cách bạn nam Cung Thiên Bình \n   Bạn nam Thiên Bình sống tình cảm, yêu hòa bình và thích sự công bằng, hợp tác. Họ thuộc tuýp người thích sáng tạo và thích khám phá những điều mới mẻ. Họ biết cách mang lại năng lượng tích cực cho người khác nên được mọi người yêu quý.  \n - Tính cách bạn nữ Cung Thiên Bình\n    Những bạn gái thuộc cung Thiên Bình thuộc tuýp người thích kết nối, có khả năng ngoại giao tốt. Họ rộng lượng và rất thẳng thắn. Họ cũng sẵn sàng đứng ra để bảo vệ sự thật và bảo vệ những người mà họ yêu quý.  \n - Cung Hoàng Đạo Thiên Bình và tình yêu \n   Thiên Bình được biết đến là cung hoàng đạo “đào hoa” nhất trong 12 cung hoàng đạo. Họ biết cách làm chủ cuộc trò chuyện nên thường dễ dàng thu hút người khác. Tuy nhiên, Thiên Bình thường tỏ ra thiếu quyết đoán trong tình yêu và dễ làm người họ yêu tổn thương. Thiên Bình thích tuýp người ấm áp, có vẻ ngoài dịu dàng, chẳng hạn như Cự Giải và Ma Kết."),
        Horoscope(name: "Cung Bọ Cạp",
                  date: "23/10 - 21/11",
                  description: "- Cung Bọ Cạp thuộc nguyên tố nước, là cung hoàng đạo đại diện cho sao Diêm Vương. Màu sắc may mắn của cung này là màu đỏ và màu hạt dẻ.\n -  Con số giúp mang lại vận may là số 9, 2 và 7. Tên tiếng Anh của cung Bọ Cạp là Scorpio.  \n - Tính cách bạn nam Cung Bọ Cạp\n  Những bạn nam thuộc cung Bọ Cạp có vẻ ngoài nam tính và mạnh mẽ. Họ là người giỏi lắng nghe và biết cách giải quyết vấn đề. Bọ Cạp nam cũng thuộc tuýp người thú vị, duyên dáng, thích giúp đỡ người khác.  \n - Tính cách bạn nữ Cung Bọ Cạp\n   Nữ Bọ Cạp có phần kiên định trong mọi chuyện. Họ biết cách duy trì mọi thứ theo một trật tự và kiểm soát chúng hiệu quả. Họ khá nhạy cảm nên đôi khi lựa chọn giải vấn đề bằng cảm xúc.  \n - Cung Hoàng Đạo Bọ Cạp và tình yêu\n    Bọ Cạp trong tình yêu là những người khó nắm bắt. Họ tỏ ra vẻ lạnh lùng, nguy hiểm nhưng thực tế lại rất dễ bị tổn thương. Họ thích những người hướng “ngoại”, năng động và nhiệt huyết, cụ thể, họ phù hợp với Bảo Bình và Sư Tử."),
        Horoscope(name: "Cung Nhân Mã",
                  date: "22/11 - 21/12",
                  description: "- Cung Nhân Mã đại diện cho sao Mộc, có tên tiếng anh là Sagittarius. Màu sắc may mắn của cung này là màu tím đậm. \n - Con số mang đến vận may cho cung Nhân Mã là 3, 5 và 8. Cung Nhân Mã thuộc nguyên tố Lửa nên có nét tính cách tương đồng với Sư Tử và Bạch Dương. \n -  Tính cách bạn nam Cung Nhân Mã\n   Bạn nam cung Nhân Mã có tính cách phóng khoáng và mạnh mẽ. Họ luôn sống tích cực, không bao giờ bỏ cuộc trước khó khăn hay thử thách. Tuy nhiên, họ cũng hay nóng nảy và măc kẹt trong mớ cảm xúc “hỗn độn” của mình. \n -  Tính cách bạn nữ Cung Nhân Mã \n   Nữ Nhân Mã coi trọng bạn bè và gia đình, họ biết tận hưởng niềm vui trong mọi cuộc gặp gỡ. Họ có nhiều tài lẻ và thường quyến rũ người khác nhờ khả năng nói chuyện duyên dáng và hài hước của mình. \n -  Cung Hoàng Đạo Nhân Mã và tình yêu\n    Nhân Mã không giỏi thể hiện bản thân trong tình yêu. Họ thuộc tuýp người sống chân thật, không giỏi nói lời hoa mỹ nên được nhận xét là khá cứng nhắc khi yêu. Họ phù hợp với các cung có tính cách cầu toàn như Xử Nữ và Song Ngư."),
        Horoscope(name: "Cung Ma Kết",
                  date: "22/12 - 19/01",
                  description: " - Ma Kết có tên trong tiếng anh là Capricorn, là cung đại diện cho sao Thổ. Những người thuộc cung Ma Kết sẽ hợp với tone màu tối, đặc biệt là màu nâu. \n -  Con số may mắn của cung này là 6, 8 và 9. Cung Ma Kết là một trong các cung hoàng đạo thuộc nguyên tố Đất, cùng nhóm với Kim Ngưu và Xử Nữ. \n -  Tính cách bạn nam Cung Ma Kết\n    Bạn nam cung Ma Kết yêu thích những nơi yên tĩnh, không thích náo nhiệt hay ồn ào. Họ là những người kiên định, có bản lĩnh và quyết tâm rất cao. Họ thường là người có học thức rộng, nhiều tài lẻ và biết cách “đối nhân, xử thế”.  \n - Tính cách bạn nữ Cung Ma Kết\n   Nữ Ma Kết được nhận xét là khá lạnh lùng và hơi nghiêm túc. Họ là người luôn tuân thủ các quy tắc mà bản thân đã đề ra và hiếm khi vượt quá giới hạn trong một việc gì đó. Ma Kết nữ chín chắn và luôn biết cách chu toàn trong mọi việc. \n -  Cung Hoàng Đạo Ma Kết và tình yêu\n      Trong tình yêu, Ma Kết tỏ ra dịu dàng và đối xử chân thành, chung thủy với người mà họ yêu. Họ luôn tôn trọng và tin tưởng tuyệt đối vào đối phương nên đôi khi có phần khá kiểm soát người mình yêu. Ma Kết thích hợp hẹn hò với Kim Ngưu và Xử Nữ - những cung có cùng nét tính cách với họ."),
        Horoscope(name: "Cung Bảo Bình",
                  date: "20/01- 18/02",
                  description: " - Cung Bảo Bình là cung hoàng đạo thuộc nguyên tố Khí. Cung hoàng đạo này là đại diện cho sao Thiên Vương, có màu sắc may mắn là màu xanh da trời hoặc xanh lơ. \n -  Những người thuộc cung này rất phù hợp với con số 2, 3, 4, 7 và 8. Bảo Bình còn có tên gọi khác trong tiếng Anh là Aquarius. \n -  Tính cách bạn nam Cung Bảo Bình\n    Nam Bảo Bình thường rất tầm tính, sống lý trí, thích dùng đầu óc để giải quyết mọi vấn đề trong cuộc sống. Đây là tuýp người sống hiện đại, có tài sáng tạo liên quan đến nghệ thuật nhưng đôi khi khó có thể tìm hiểu được hết về họ.  \n - Tính cách bạn nữ Cung Bảo Bình\n    Nữ Bảo Bình thường là các cô nàng có vẻ ngoài sáng, xinh đẹp và thu hút ánh nhìn của người khác. Họ là những người khó đoán, năng động và hoạt bát. Cách họ dẫn dắt câu chuyện rất duyên dáng và hài hước nên mọi người thường muốn kết giao với nữ cung Bảo Bình.  \n - Cung Hoàng Đạo Bảo Bình và tình yêu\n    Bảo Bình yêu thầm lặng, hiếm khi thể hiện tình cảm với người mà họ yêu. Tuy nhiên, khi yêu, Bảo Bình rất chân thành và chung thủy, không dễ bị lung lay hay thay đổi. Họ ân cần và chu đáo, biết cách chăm sóc đối phương. Họ phù hợp yêu đương với cung Bạch Dương hay Nhân Mã."),
        Horoscope(name: "Cung Song Ngư ",
                  date: "19/02 - 20/03",
                  description: "- Song Ngư là một trong 12 cung hoàng đạo thuộc nguyên tố Nước. Con số may mắn của những người thuộc cung này là 1, 3, 4 và 9.  \n - Cung Song Ngư còn có tên gọi khác trong tiếng Anh là Pisces, là đại diện cho sao Hải Vương và màu sắc mang lại vận may cho họ là màu xám, tím hoặc xanh dương.  \n - Tính cách bạn nam Cung Song Ngư\n    Nam Song Ngư có tấm lòng nhân hậu, biết quan tâm mọi người xung quanh. Họ cũng là những người vị tha nên hiếm khi có thù hằn với ai. Họ thuộc tuýp người kiêu ngạo, tự tin và tham vọng. Họ luôn nỗ lực để đạt được mục tiêu của mình.  \n - Tính cách bạn nữ Cung Song Ngư\n    Nữ Song Ngư khá thân thiện, hòa đồng nên được mọi người xung quanh yêu quý. Họ là những người đáng tin cậy, luôn biết cách an ủi và động viên người khác. Họ có vẻ ngoài tự tin và đầy cuốn hút nên thường có nhiều “vệ tinh” vây quanh.  \n - Cung Hoàng Đạo Song Ngư và tình yêu\n    Trong tình yêu, Song Ngư thuộc tuýp người hay mơ mộng và sống lãng mạn họ thường biết cách tạo bất ngờ cho đối phương. Song Ngư yêu chung tình và thường sẽ trở nên suy sụp nếu biết bản thân bị phản bội.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Action cho các button
    @IBAction func ariesButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[0]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func taurusButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[1]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func geminiButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[2]
        showHoroscopeDetail(for: horoscope)
    }
    @IBAction func cancerButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[3]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func leoButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[4]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func virgoButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[5]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func libraButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[6]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func scorpioButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[7]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func sagittariusButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[8]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func capricornButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[9]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func aquariusButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[10]
        showHoroscopeDetail(for: horoscope)
    }
    
    @IBAction func piscesButtonTapped(_ sender: UIButton) {
        let horoscope = horoscopes[11]
        showHoroscopeDetail(for: horoscope)
    }
    
    func showHoroscopeDetail(for horoscope: Horoscope) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HoroscopeDetailView") as! HoroscopeDetailView
        vc.horoscope = horoscope
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

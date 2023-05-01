package tw.eeit117.wematch.video.chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.MessageHandler;
import javax.websocket.Session;

import org.apache.log4j.Logger;

public class CustomerMessageHandler implements MessageHandler.Whole<String> {
	private static final Logger LOGGER = Logger.getLogger(ProgrammaticEchoEnpoint.class);
	Session session ;
	Map<String, String> responseBank = new HashMap<>();
	public CustomerMessageHandler(Session session) {
		this.session = session;
		responseBank.put("hello", "嗨!Fitness Space智慧諮詢小編很高興為您服務~");
		responseBank.put("嗨", "Hello!Fitness Space智慧諮詢小編很高興為您服務~");
		responseBank.put("hi", "哈囉!Fitness Space智慧諮詢小編很高興為您服務~");
		responseBank.put("你好", "你好!Fitness Space智慧諮詢小編很高興為您服務~");
		responseBank.put("謝謝", "不會，幫助您是小編應該做的~");
		responseBank.put("3Q", "不會，幫助您是小編應該做的~");
		responseBank.put("掰掰", "再見，很高興有機會為您服務~");
		responseBank.put("掰", "再見，很高興有機會為您服務~");
		responseBank.put("886", "再見，很高興有機會為您服務~");
		responseBank.put("是在哈囉", "Errrr.....");
		responseBank.put("GG", "唉呦，不要那麼悲觀，再接再厲，把握機會，總有一天會是你的！~");
		responseBank.put("gg", "唉呦，不要那麼悲觀，再接再厲，把握機會，總有一天會是你的！~");
		responseBank.put("QQ", "不哭不哭，眼淚是珍珠~");
		responseBank.put("qq", "不哭不哭，眼淚是珍珠~");
		responseBank.put("三大肌群", "本站所指三大肌群是指人體的七大肌肉群中的胸部肌群、腿部肌群、背部肌群，這三大肌群可以說是人體最大的三塊肌群，從增肌角度來說想要身材比例協調，穿衣顯瘦脫衣有肉，這三大肌肉群即為關鍵所在。");
		responseBank.put("背部肌群", "背部肌群是由闊背肌與脊柱站立肌群所組成，一般的背肌訓練處方，都是搭配胸部肌群來從事上半身的訓練，藉由推拉原理使得有穩定上半身的效果。平時如果不刻意用力伸展背部、特別的展現，是不易看見身體的背部肌肉線條的。");
		responseBank.put("胸部肌群", "人體上半身胸腔當中，最顯而易見的重要肌群，即是胸部肌群，主要包含胸大肌、胸小肌以及前鋸肌。「胸大肌」只要自我從事伏地挺身運動一段時日之後, 可以說大都能使男性都能擁有「厚實的胸膛」。");
		responseBank.put("腿部肌群", "腿部肌群包括大腿肌群、小腿肌群，基本上跑、走、蹲、站的一切活動，樣樣行為都得利用到腿部的肌群。從事慢跑運動即是常見亦很有效的訓練腿部之運動項目。");
		responseBank.put("背部肌群初級推薦", "好的，推薦初學者的您觀看\"練背怎麼練\"影片以達初學者的需求~");
		responseBank.put("胸部肌群初級推薦", "好的，推薦初學者的您觀看\"四招訓練胸部核心肌群\"影片以達初學者的需求~");
		responseBank.put("腿部肌群初級推薦", "好的，推薦初學者的您觀看\"3招練腿肌\"影片以達初學者的需求~");
		responseBank.put("背部肌群中級推薦", "好的，針對近乎學有所成的您，小編推薦可嘗試看看\"背肌4大關鍵\"影片來提升自我~");
		responseBank.put("胸部肌群中級推薦", "好的，針對近乎學有所成的您，小編推薦可嘗試看看\"坐姿胸推訓練\"影片來提升自我~");
		responseBank.put("腿部肌群中級推薦", "好的，針對近乎學有所成的您，小編推薦可嘗試看看\"完美的腿部訓練\"影片來提升自我~");
		responseBank.put("背部肌群高級推薦", "哈，相信會詢問小編這個問題的您已然是個經驗老道的健身者，只要照著自己的進度持之以恆即可，有健康的身體就有燦爛的人生，加油！");
		responseBank.put("胸部肌群高級推薦", "哈，相信會詢問小編這個問題的您已然是個經驗老道的健身者，只要照著自己的進度持之以恆即可，有健康的身體就有燦爛的人生，加油！");
		responseBank.put("腿部肌群高級推薦", "哈，相信會詢問小編這個問題的您已然是個經驗老道的健身者，只要照著自己的進度持之以恆即可，有健康的身體就有燦爛的人生，加油！");
		responseBank.put("背部肌群風險", "一般來說，多數人較不重視背肌訓練，因而強化其他肌群，在此提醒，若身體前側的肌肉太強，而背側的肌肉太弱，導致身體肌肉的失衡，會更加重駝背、圓肩的情況發生，而肩膀的穩定度也會變差，從而也增加了受傷的風險。");
		responseBank.put("胸部肌群風險", "近期有研究發現若只狂練上半身胸部肌群，恐增心血管疾病風險，在此建議要採全身性阻力訓練較適合");
		responseBank.put("腿部肌群風險", "腿部肌群訓練非常重要，當我們腿部肌肉不足時，很容易造成膝蓋的角度不正確，久而久之讓我們膝蓋的韌帶受到傷害。");
		
	}

	@Override
	public void onMessage(String message) {
		try {
			LOGGER.info("程式版的ServerEndpoint：收到客戶端送來訊息: " + message);
			String response = responseBank.get(message);
			if(response == null) {
				response = "抱歉，這部分的資訊小編這邊不太清楚，未來我們會再更加精進，敬請期待之後的我們!!!";
			}
			
			session.getBasicRemote().sendText(response);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}

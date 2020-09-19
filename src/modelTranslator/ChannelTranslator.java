package modelTranslator;

import model.Channel;

public class ChannelTranslator {
	public static String translate(Channel channel) {
		return String.format(
				"chan %s = [0] of {mtype:%s_states};\n\n",
				channel,
				channel.getParameter().getName()
		);
	}
}

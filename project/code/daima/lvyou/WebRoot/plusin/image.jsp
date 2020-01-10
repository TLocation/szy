
<%@ page contentType="image/jpeg"
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>

<%!//产生随机颜色函数getRandColor
Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);//红
		int g = fc + random.nextInt(bc - fc);//绿
		int b = fc + random.nextInt(bc - fc);//蓝
		return new Color(r, g, b);
	}%>
<%
	//out.clear();//设置页面不缓存
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	//在内存中创建图像，宽度为width，高度为height
	int width = 60, height = 20;
	BufferedImage image = new BufferedImage(width, height,
			BufferedImage.TYPE_INT_RGB);
	//获取图形上下文环境
	Graphics g = image.getGraphics();
	//创建随机类
	Random random = new Random();
	//设置背景色并进行填充
	g.setColor(getRandColor(200, 250));
	g.fillRect(0, 0, width, height);
	//设置图形上下文环境文字
	g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
	//随机产生200条干扰直线，使图像中的认证码不易被其他分析程序探测到
	g.setColor(getRandColor(160, 200));
	for (int i = 0; i < 155; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(12);
		int yl = random.nextInt(12);
		g.drawLine(x, y, x + xl, y + yl);
	}
	//随机产生4位数的验证码
	String sRand = "";
	for (int i = 0; i < 4; i++) {
	//随机产生10以类随机数字rand
		String rand = String.valueOf(random.nextInt(10));
		sRand += rand;
		//将认证码用drawString函数显示到图像里
		g.setColor(new Color(20 + random.nextInt(110), 20 + random
				.nextInt(110), 20 + random.nextInt(110)));
		g.drawString(rand, 13 * i + 6, 16);
	}
	//将认证码sRand存入session共享
	session.setAttribute("validcode", sRand);
	//释放图形上下文环境
	g.dispose();
	//输出生成后的验证码图形到页面
	ImageIO.write(image, "JPEG", response.getOutputStream());
	
	out.clear();  
    out = pageContext.pushBody();  
	
	
%>

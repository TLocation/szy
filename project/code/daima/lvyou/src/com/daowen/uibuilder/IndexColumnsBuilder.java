package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.List;

import com.daowen.dal.DALBase;
import com.daowen.entity.Indexcolumns;

public class IndexColumnsBuilder {

	
	public String buildColumns(){
		
		int columncontentsize=10;
		StringBuffer sb=new StringBuffer();
		LanmuBuilder  shangpinbuilder=new LanmuBuilder("box");
		sb.append("<div class=\"page-main-box white-paper\">");
		sb.append("<div class=\"row-flow\">");
		List<Indexcolumns>  list=DALBase.getEntity("indexcolumns", "");
		int i=1;
		for (Indexcolumns indexcolumns : list) {
			if(indexcolumns.getLayout()!=null&&indexcolumns.getLayout().equals("1"))
			{
				sb.append("<div class=\"clear\"></div>");
				
			}else {
				sb.append(MessageFormat.format("<div class=\"column\" style=\"width:{0}\">",indexcolumns.getWidth()));
			}
			if(indexcolumns.getShowstyle().equals("图片")){
				sb.append(shangpinbuilder.buildImageLanmu(indexcolumns.getColid()));
			}
			if(indexcolumns.getShowstyle().equals("文本")){
			    sb.append(shangpinbuilder.buildTextLanmu(indexcolumns.getColid()));
			}
			sb.append("\r\n");
			
			//结束列
			if(indexcolumns.getLayout()!=null&&indexcolumns.getLayout().equals("2"))
			   sb.append("</div>");
			
			
			
			i++;
			
		}
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
		
		
	}
	
	
}

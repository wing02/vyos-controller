package com.github.wing02.vyoscontroller.dao;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

public class Sh2Xml {
	String sh2Xml(String shStr) {
		tokens = shStr.split("\\s+");

		String rootValue = "zone-policy";
		Element root = new Element(rootValue);
		i = 0;
		setSh2Xml(root);
		Document doc = new Document(root);
		// 使用JDOM提供的XMLOutputter类输出
		XMLOutputter out = new XMLOutputter();
		// 设置xml文件的Encoding
		out.setFormat(Format.getCompactFormat().setEncoding("gb2312"));
		// 我这里先打印查看一下生成的字符串
		String xmlStr = out.outputString(doc);
		return xmlStr;
	}

	static int i;
	static String tokens[];

	static void setSh2Xml(Element root) {
		Element now = null;
		while (i < tokens.length) {
			if (tokens[i].equals("{")) {
				i++;
				setSh2Xml(now);
				if (i == tokens.length)
					return;
			} else if (tokens[i].equals("}")) {
				i++;
				return;
			} else {
				now = new Element(tokens[i]);
				root.addContent(now);
				i++;
				if (tokens[i].equals("{") || tokens[i].equals("}"))
					continue;
				now.addContent(tokens[i]);
				i++;
			}
		}

	}
}

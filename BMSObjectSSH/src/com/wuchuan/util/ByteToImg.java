package com.wuchuan.util;

import java.io.File;

import javax.imageio.stream.FileImageOutputStream;


public class ByteToImg {
	/*
	 * 二进制转图片保存到路径
	 */
	 public static String byteimage(byte[] data, String path) {
	        if (data.length < 3 || path.equals(""))
	        return "参数异常！";
	    try {
	        FileImageOutputStream imageOutput = new FileImageOutputStream(new File(path));
	        imageOutput.write(data, 0, data.length);
	        imageOutput.close();
	        return path;
	    }
	    catch (Exception ex) {
	        ex.printStackTrace();
	        return ex.toString();
	    }
	}
}

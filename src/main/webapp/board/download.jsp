<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>    
<% request.setCharacterEncoding("UTF-8");
	// 파일경로
	String dir = "D:/fullstack prac/bbsrr/src/main/webapp/upload";
	String filename = request.getParameter("filename"); // 서버에 저장되어 있는 파일명
	String ofilename = request.getParameter("ofilename"); // 원래 파일명
	
	InputStream in = null;
	OutputStream os = null;
	File file = null;
	boolean skip = true;
	String client = "";
	
	try{
		// 파일을 읽어서 스트림에 담는다.
		file = new File(dir, filename);
		in = new FileInputStream(file);
	} catch(FileNotFoundException e){
		skip = false;
	}
	
	client = request.getHeader("User-Agent");
	// 헤더에 강제 파일 다운로드 지정
	response.reset();
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Description", "JSP Generated Data");
	
	if(skip){

		//한글파일일 경우 처리
		ofilename = new String(ofilename.getBytes("utf-8"), "iso-8859-1");
		
		//다운로드할 파일 경로를 헤더에 적어줌
		response.setHeader("Content-Diposition", "attachment; filename=\""+ofilename+"\"");
		response.setHeader("Content-Length", ""+file.length());
		
		os = response.getOutputStream();
		byte b[] = new byte[(int)file.length()];
		int leng = 0;
		
		while((leng = in.read(b))>0){
			os.write(b,0,leng);
		}
	}else{
		response.setContentType("text/html;charset=utf-8");
		out.println("파일을 찾을 수 없습니다.");
	}	
%>
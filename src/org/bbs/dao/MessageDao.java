package org.bbs.dao;

import groovy.lang.GroovyClassLoader;
import groovy.lang.GroovyObject;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.bbs.models.Message;
import org.codehaus.groovy.control.CompilationFailedException;

public class MessageDao {
	 GroovyClassLoader loader=new GroovyClassLoader(getClass().getClassLoader());

	File f=new File("C:/Documents and Settings/Administrator/Documents/workspace-sts-3.1.0.RELEASE/BBS/groovy/dao/MessageUtil.groovy");

	public int save(Message message) throws CompilationFailedException, IOException, InstantiationException, IllegalAccessException{
		Class groovyClass=loader.parseClass(f.getAbsoluteFile());
		GroovyObject go=(GroovyObject)groovyClass.newInstance();
		return (int)go.invokeMethod("save", message);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Message> listByPage(int page) throws InstantiationException, IllegalAccessException{
		Class messageUtil = null;
		try {
			messageUtil = loader.parseClass(f);
		} catch (CompilationFailedException e) {
		
			e.printStackTrace();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return (List<Message>)((GroovyObject)messageUtil.newInstance()).invokeMethod("listByPage", page);
	}
	/**
	 * 返回总页数
	 * @return
	 * @throws CompilationFailedException
	 * @throws IOException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	public int getTotalPageNum() throws CompilationFailedException, IOException, InstantiationException, IllegalAccessException{
		Class messageUtil=null;
			messageUtil=loader.parseClass(f);
			
		return (int)((GroovyObject)messageUtil.newInstance()).invokeMethod("getTotalPageNum", null); 
	}
	
	
	/*
	public static void main(String[] args) throws ParseException, CompilationFailedException, IOException, InstantiationException, IllegalAccessException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date=null;
		String time="2012-1-9 12:30:55";
		date=sdf.parse(time);
		System.out.println(date);
		long mils=date.getTime();
		for(int i=0;i<37;i++){
			
			//new MessageDao().save(new Message(null,"testMessage","testAuthor",new Timestamp(mils)));
		}
		//����listBypage(*)
		System.out.println(new MessageDao().listByPage(10).size());
	
	}
	*/
}

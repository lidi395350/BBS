package org.bbs.models;

import java.sql.Timestamp;
import java.util.Date;

public class Message {

	/**
	 * @param args
	 */
private Long id;
private String message;
private String author;
private Timestamp postTime;
public Message(Long id, String message, String author, Timestamp postTime) {
	super();
	this.id = id;
	this.message = message;
	this.author = author;
	this.postTime = postTime;
}
public Message() {
	super();
	// TODO Auto-generated constructor stub
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public Date getPostTime() {
	return postTime;
}
public void setPostTime(Timestamp postTime) {
	this.postTime = postTime;
}
@Override
public String toString() {
	return "Message [id=" + id + ", message=" + message + ", author=" + author
			+ ", postTime=" + postTime + "]";
}

}

package com.contrlr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entities.Jobs;

@Controller
public class FrontController {
	
	@RequestMapping("/home")
	public String home(Model m) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver"); 
		String url="jdbc:mysql://localhost:3306";
		String u="root";
		String p="0123456789";
		Connection connection=DriverManager.getConnection(url,u,p);
		Statement stmt=connection.createStatement();
		List<Jobs> list=new ArrayList<Jobs>();
		ResultSet rs=stmt.executeQuery("SELECT * FROM job_notifications.jobs");
		while(rs.next()) {
			Jobs j=new Jobs();
			j.setJobTitle(rs.getString("jobTitle"));
			j.setJobContent(rs.getString("job description"));
			j.setJobUrl(rs.getString("jobURL"));
			j.setJobDate(rs.getString("job posted date"));
			list.add(j);
		}
		m.addAttribute("list", list);
		m.addAttribute("page", "home");
		return "home";
	}
	@RequestMapping("/add")
	public String addJob(Model m) {
		
		Jobs j=new Jobs();
		
		m.addAttribute("job", j);
		m.addAttribute("page", "add");
		
		return "home";
		
	}
	@RequestMapping("/saveJob")
	public String saveJob(@ModelAttribute("job") Jobs j,  Model m) throws SQLException, ClassNotFoundException {
		
		Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    j.setJobDate(formatter.format(date));
	    
		System.out.println(j);
		Class.forName("com.mysql.jdbc.Driver"); 
		String url="jdbc:mysql://localhost:3306";
		String u="root";
		String p="0123456789";
		Connection connection=DriverManager.getConnection(url,u,p);
		PreparedStatement stmt = connection.prepareStatement("INSERT INTO  job_notifications.jobs VALUES(?,?,?,?)");
		stmt.setString(1,j.getJobTitle());
		stmt.setString(4,j.getJobUrl());
		stmt.setString(3,j.getJobContent());
		stmt.setString(2, formatter.format(date));
		stmt.executeUpdate();
		
		m.addAttribute("page", "add");
		m.addAttribute("msg", "Job successfully added !");
		return "home";
	}

}

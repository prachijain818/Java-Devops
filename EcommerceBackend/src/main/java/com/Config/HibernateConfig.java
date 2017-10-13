package com.Config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.Model.Cart;
import com.Model.Category;
import com.Model.Orders;
import com.Model.Product;
import com.Model.Supplier;
import com.Model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com")
public class HibernateConfig {
	 
	 
	    @Bean
	    public SessionFactory sessionFactory(DataSource datasource) {
	        LocalSessionFactoryBuilder sessionb = new LocalSessionFactoryBuilder(datasource);
	        sessionb.addProperties(hibernateProperties());
	        sessionb.addAnnotatedClass(User.class);
	        sessionb.addAnnotatedClass(Product.class);
	        sessionb.addAnnotatedClass(Cart.class);
	        sessionb.addAnnotatedClass(Category.class);
	        sessionb.addAnnotatedClass(Supplier.class);
	        sessionb.addAnnotatedClass(Orders.class);
	        

	        return sessionb.buildSessionFactory();
	     }
	     
	    @Bean(name="datasource")
	    public DataSource dataSource() {
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setDriverClassName("org.h2.Driver");
	        dataSource.setUrl("jdbc:h2:tcp://localhost/~/app");
	        dataSource.setUsername("sa");
	        dataSource.setPassword("");
	        return dataSource;
	    }
	     
	    private Properties hibernateProperties() {
	        Properties properties = new Properties();
	        properties.put("hibernate.dialect",("org.hibernate.dialect.H2Dialect"));
	        properties.put("hibernate.show_sql",("true"));
	        properties.put("hibernate.hbm2ddl.auto",("update"));
	        return properties;        
	    }
	     
	    
	    
	    @Bean
	    
	    public HibernateTransactionManager transactionManager(SessionFactory s) {
	       HibernateTransactionManager txManager = new HibernateTransactionManager();
	       txManager.setSessionFactory(s);
	       return txManager;
	    }
	}

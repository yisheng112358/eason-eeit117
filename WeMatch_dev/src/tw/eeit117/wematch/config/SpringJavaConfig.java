package tw.eeit117.wematch.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

@Configuration
public class SpringJavaConfig {

	Environment env;

	@Autowired
	public void setEnv(Environment env) {
		this.env = env;
	}

	@Bean
	public DataSource dataSourceForWeb() throws IllegalArgumentException, NamingException {
		JndiObjectFactoryBean jndiObjectFactoryBean = new JndiObjectFactoryBean();
		jndiObjectFactoryBean.setJndiName("java:comp/env/connectSQLServerJdbc/WeMatch");
		jndiObjectFactoryBean.setResourceRef(true);
		jndiObjectFactoryBean.setProxyInterface(DataSource.class);
		jndiObjectFactoryBean.setLookupOnStartup(false);
		jndiObjectFactoryBean.afterPropertiesSet();
		DataSource ds = (DataSource) jndiObjectFactoryBean.getObject();
		return ds;
	}

	@Bean(destroyMethod = "destroy")
	public LocalSessionFactoryBean sessionFactory() throws IOException, IllegalArgumentException, NamingException {
		LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
		localSessionFactoryBean.setDataSource(dataSourceForWeb());
		localSessionFactoryBean.setPackagesToScan(new String[] { "tw.eeit117.wematch" });

		Properties hibernateProperties = new Properties();
		InputStream input = getClass().getResourceAsStream("/Hibernate.properties");
		hibernateProperties.load(input);
		input.close();
		localSessionFactoryBean.setHibernateProperties(hibernateProperties);
		localSessionFactoryBean.afterPropertiesSet();

		return localSessionFactoryBean;
	}

	@Bean
	public DriverManagerDataSource dataSourceForLocal() {
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		driverManagerDataSource.setUrl("jdbc:sqlserver://localhost:1433;databaseName=WeMatch");
		driverManagerDataSource.setUsername("sa");
		driverManagerDataSource.setPassword("P@ssw0rd");
		return driverManagerDataSource;
	}

	@Bean(destroyMethod = "destroy")
	public LocalSessionFactoryBean sessionFactoryForLocal()
			throws IOException, IllegalArgumentException, NamingException {
		LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
		localSessionFactoryBean.setDataSource(dataSourceForLocal());
		localSessionFactoryBean.setPackagesToScan(new String[] { "tw.eeit117.wematch" });

		Properties hibernateProperties = new Properties();
		InputStream input = getClass().getResourceAsStream("/Hibernate.properties");
		hibernateProperties.load(input);
		input.close();
		localSessionFactoryBean.setHibernateProperties(hibernateProperties);
		localSessionFactoryBean.afterPropertiesSet();

		return localSessionFactoryBean;
	}
}

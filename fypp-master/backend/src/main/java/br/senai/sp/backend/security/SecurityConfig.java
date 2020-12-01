package br.senai.sp.backend.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private JwtAuthService jwtAuthService;
	
	@Autowired
	private UserDetailServiceImpl userDetailService;
	
	@Autowired
	DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// Enable jdbc authentication
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder());
	}
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.httpBasic().disable()
		.csrf().disable()
		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
		.and()
		.authorizeRequests()
			.antMatchers(HttpMethod.POST, "/photo/auth/cliente/login").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/auth/login").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/clientes/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/cliente/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/especialidades/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografo/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografos/categoria/{id}/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/fotografo").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/cliente").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/upload/imagem").permitAll()
			.antMatchers(HttpMethod.PUT, "/photo/cliente/**").permitAll()
			.antMatchers(HttpMethod.PUT, "/photo/fotografo/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografos/categoria/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografo/{id}**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/portfolios/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografos/email/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/clientes/email/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/portfolios/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografoPortfolios/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/fotografoPortfolios/{id}**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/portfolio/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/fotoPortfolio/**").permitAll()	
			.antMatchers(HttpMethod.GET, "/photo/pacotes/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/pacote/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/enderecos/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/endereco/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/agendas/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/agenda/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/avaliacoes/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/avaliacao/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/contratacoes/**").permitAll()
			.antMatchers(HttpMethod.POST, "/photo/contratacao/**").permitAll()
			.antMatchers(HttpMethod.PUT, "/photo/portfolio/{id}/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/portfolios/{id}/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/contratacoes/{id}/**").permitAll()
			.antMatchers(HttpMethod.GET, "/photo/contratacoes/name/{card_holder_name}**").permitAll()
			.antMatchers(HttpMethod.OPTIONS, "/**").permitAll()
		.anyRequest().authenticated()
	.and()
		.apply(new JwtAuthConfigurer(jwtAuthService)); 
}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		auth.userDetailsService(userDetailService).passwordEncoder(encoder);
	}
}

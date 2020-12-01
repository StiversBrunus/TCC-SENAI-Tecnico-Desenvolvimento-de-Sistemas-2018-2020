import React from 'react'
import Instagram from './imagens/icons/instagram.png'
import Facebook from './imagens/icons/facebook.png'
import Twitter from './imagens/icons/twitter.png'
import './css/Footer.css'

function Footer() {
	return (
		<footer className="page-footer">
			<div className="container">
				<div className="row">
					<div className="col l6 s12">
						<h5>Fypp</h5>
						<p>Find you perfect photographer.</p>
						<div className="row ">
							<div className="col s2 center">
								<img src={Instagram} alt=""></img>
							</div>
							<div className="col s2 center">
								<img src={Facebook} alt=""></img>
							</div>
							<div className="col s2" >
								<img src={Twitter} alt=""></img>
							</div>
						</div>
					</div>
					<div className="col l4 offset-l2 s12">
						<h5>Empresa</h5>
						<ul>
							<li><a href="#!">Quem somos</a></li>
							<li><a href="#!">Serviços</a></li>
							<li><a href="#!">Porque a Fypp</a></li>
							<li><a href="#!">Baixe o app</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div className="footer-copyright center">
				<div className="container" style={{ color: "#641682" }}>
					© 2020 Fypp
              </div>
			</div>
		</footer>
	)
}

export default Footer
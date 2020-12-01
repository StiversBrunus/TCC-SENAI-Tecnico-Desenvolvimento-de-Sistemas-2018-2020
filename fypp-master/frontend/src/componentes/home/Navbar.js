import React, { Component } from 'react';
import './css/Navbar.css'
import { Link } from 'react-scroll'
import BtnLogin from './botaoLogin/btnLogin'

class Navbar extends Component {

    render() {
        return (
            <div>
                <nav>
                    <div className="container">
                        <div className="row s12">
                            <div className="nav-wrapper">
                                <a href="#" className="brand-logo" id='Fypp-navbar'>Fypp</a>
                                <ul id="nav-mobile" className="right hide-on-med-and-down">
                                    <li><Link to="container-sessao2" smooth={true} duration={1000}>Quem somos</Link></li>
                                    <li><Link to="container-sessao3" smooth={true} duration={1000}>Nossos Serviços</Link></li>
                                    <li><Link to="container-sessao4" smooth={true} duration={1500}>Porque a Fypp</Link></li>
                                    <li><Link to="container-sessao5" smooth={true} duration={1500}>Baixe o app</Link></li>
                                    <li><Link to="container-sessao6" smooth={true} duration={2000}>Contate-nos</Link></li>
                                    <BtnLogin/>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        )
    }
}

export default Navbar
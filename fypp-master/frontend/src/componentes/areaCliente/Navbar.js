import React, { Component } from 'react'
import { Link } from 'react-router-dom'

class Navbar extends Component {

    componentDidMount(){
        document.addEventListener('DOMContentLoaded', function() {
            const M = window.M;
            var elems = document.querySelectorAll('#slide-out-fotografo');
            var instances = M.Sidenav.init(elems, {});
        });
    }
    
    render() {
        return (
            <div>
                <ul id="slide-out-fotografo" className="sidenav sidenav-fixed" style={{ backgroundColor: '#641682' }}>
                    <li style={{marginTop:'1em'}}>
                        <a className="" style={{color:'#ffffff', fontWeight:'bold', cursor:'default'}}>
                            <i className="material-icons right" style={{color:'#ffffff', cursor:'default'}}>
                                expand_more
                            </i>Seu perfil
                        </a>
                    </li>
                    <div className="user-view center" style={{marginTop:'1.5em'}}>
                        <div className="col s12 center">
                            <img className="circle responsive-img" style={{marginLeft:'auto', marginRight:'auto'}} src={localStorage.getItem('fotoPerfilCliente')}/>
                        </div>
                        <span className="white-text name" style={{cursor:'default'}}>Bem vindo, {localStorage.getItem('nomeCliente')}</span>
                        <span className="white-text email" style={{cursor:'default'}}>{localStorage.getItem('emailCliente')}</span>
                    </div>
                    <div className="col s12">
                        <li style={{marginTop:'1em'}}>
                            <Link to="/cliente/categorias" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    dehaze
                                </i>Categorias
                            </Link>
                            <Link to="/cliente/fotografos" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    photo_camera
                                </i>Fotógrafos
                            </Link>
                            <Link to="/cliente/contratacoes" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    done
                                </i>Contratações
                            </Link>
                        </li>
                    </div>
                    <div className="col s12" style={{marginTop:'6em'}}>
                        <li style={{marginTop:'1em'}}>
                            <Link to="#terminar" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                settings
                                </i>Configurações
                            </Link>
                            <Link to="#terminar" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    exit_to_app
                                </i>Sair
                            </Link>
                        </li>
                    </div>
                </ul>
                
                <div className="hide-on-large-only">
                    <nav>
                        <div className="nav-wrapper">
                            <a href="#!" className="brand-logo right">Logo</a>
                            <ul className="">
                                <li><a href="#" data-target="slide-out-fotografo" className="sidenav-trigger"><i className="material-icons">menu</i></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        )
    }
}

export default Navbar;

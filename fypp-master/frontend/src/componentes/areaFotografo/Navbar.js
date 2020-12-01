import React, { Component } from 'react'
import { Link } from 'react-router-dom'

document.addEventListener('DOMContentLoaded', function() {
    const M = window.M;
    var elems = document.querySelectorAll('#slide-out-fotografo');
    var instances = M.Sidenav.init(elems, {});
  });

class Navbar extends Component {
    render() {
        return (
            <div>
                <ul id="slide-out-fotografo" className="sidenav sidenav-fixed" style={{ backgroundColor: '#641682' }}>
                    <li style={{marginTop:'1em'}}>
                        <a style={{color:'#ffffff', fontWeight:'bold', cursor:'default'}}>
                            <i className="material-icons right" style={{color:'#ffffff', cursor:'default'}}>
                                expand_more
                            </i>Seu perfil
                        </a>
                    </li>
                    <div className="user-view center" style={{marginTop:'1.5em', cursor:'default'}}>
                        <div className="col s12 center" >
                            <a className="center">
                                <img className="circle responsive-img" style={{marginLeft:'auto', cursor:'default', marginRight:'auto'}} src={localStorage.getItem('fotoPerfilFotografo')}/>
                            </a>
                        </div>
                        
                        <a><span className="white-text name" style={{cursor:'default'}}>Bem vindo(a), 
                            <span style={{textTransform:'capitalize'}}> {localStorage.getItem('nomeFotografo')}</span> 
                        </span></a>
                        <a><span className="white-text email" style={{cursor:'default'}}>{localStorage.getItem('emailFotografo')}</span></a>
                    </div>
                   
                    <div className="col s12">
                        <li style={{marginTop:'1em'}}>
                            <Link to="/fotografo/trabalhos" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    work
                                </i>Trabalhos
                            </Link>

                            <Link to="/fotografo/portfolio" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    photo_camera
                                </i>Portfólio
                            </Link>

                            <Link to="/fotografo/pacotes" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    monetization_on
                                </i>Pacotes
                            </Link>

                            <Link to="#!" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                    event
                                </i>Agenda
                            </Link>
                        </li>
                    </div>


                    <div className="col s12" style={{marginTop:'6em'}}>
                    {/* <li><a class="subheader">Configurações</a></li> */}
                    {/* <li><div class="divider"></div></li> */}
                        <li style={{marginTop:'1em'}}>
                            <Link to="#!" style={{color:'#ffffff'}}>
                                <i className="material-icons left" style={{color:'#ffffff'}}>
                                settings
                                </i>Configurações
                            </Link>

                            <Link to="#!" style={{color:'#ffffff'}}>
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

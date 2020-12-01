import React from 'react'
import './css/Sessao1.css'
import {Onda01} from './ondas/Ondas'
import BtnCadastro from './botaoCadastro/btnCadastro'

function Sessao1(){
    return(
        <div>
            <div id="container-sessao1">
                <div className="container">
                    <div className="row right hide-on-large-only" style={{marginTop:'2em'}}>
                        <div className="col s12">
                            <li style={{ color: '#641682' }}>
                                <ul id="dropdown-sessao"  className="dropdown-content">
                                    <li><a href="#!">Cliente</a></li>
                                    <li><a href="#!">Fotografo</a></li>
                                </ul>
                                <a className="btn-large dropdown-trigger white" style={{fontWeight:'bold'}} href="#!" style={{ color: '#641682' }} data-target="dropdown-sessao">Login</a>
                            </li>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col l7 s12" id="div-btncadastro">
                            <div className="row">
                                <div id="div-slogan" className="col l12">
                                    <h4>
                                        Criamos oportunidades para que seus melhores momentos sejam registrados.
                                    </h4>
                                </div>
                                <div className="col l12" id="div-input-btn-cadastro">
                                    <BtnCadastro/>  
                                </div>                            
                            </div>
                        </div>
                        <div className="col l5 right-align hide-on-small-only" id="div-img-circulo">
                            <div id="circulo-img">
                                
                            </div>                    
                        </div>
                    </div>
                </div>
            </div>
            <Onda01/>
        </div>
    )
}

export default Sessao1

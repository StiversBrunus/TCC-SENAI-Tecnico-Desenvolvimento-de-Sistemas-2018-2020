import React, { Component } from 'react'
import Navbar from '../Navbar'
import CardPacote from './CardPacote'
import { Link } from 'react-router-dom'

class Pacotes extends Component {
    render() {
        return (
            <div>
                <Navbar/>
                <div id="container-index-fotografo">
                    <div className="container">
                        <div className="row">
                            <div className="col l10 s12 m12 offset-l2 offset-m0 offset-s0 ">
                                <div className="row">
                                    <div id="div-slogan" className="col l" >
                                        <h4 className="valign-wrapper" style={{color:'#641682',fontSize:'30px', fontFamily:"Montserrat-extrabold"}}>
                                            <i className="small material-icons left" style={{color:'#641682'}}>
                                                attach_money
                                            </i>Pacotes
                                        </h4>
                                    </div>
                                    <div id="div-slogan" className="col l6 right" >
                                        <h4 className="valign-wrapper right" style={{backgroundColor:'#641682',fontSize:'30px', fontFamily:"Montserrat-extrabold"}}>
                                            <Link to='/fotografo/pacotes/novo' className="waves-effect waves-light btn center"><i className="material-icons right ">add</i><span className="hide-on-small-only">Criar pacote</span></Link>
                                        </h4>
                                    </div>

                                    <CardPacote/>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default Pacotes


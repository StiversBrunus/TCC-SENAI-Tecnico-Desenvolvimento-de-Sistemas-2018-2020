import React, { Component } from 'react'
import Navbar from '../Navbar'

class Trabalhos extends Component {
    render() {
        return (
            <div>
                <Navbar/>
                <div id="container-index-fotografo">
                    <div className="container">
                        <div className="row">
                            <div className="col l10 s12 m12 offset-l2 offset-m0 offset-s0 ">
                                <div className="row">
                                    <div id="div-slogan" className="col l12" >
                                        <h4 className="valign-wrapper" style={{color:'#641682',fontSize:'30px', fontFamily:"Montserrat-extrabold"}}>
                                            <i className="small material-icons left" style={{color:'#641682'}}>
                                                work
                                            </i>Trabalhos
                                        </h4>
                                    </div>

                                    {/* TITULO PROPOSTA */}
                                    <div className="col l12 m12 s12">
                                        <h4 className="valign-wrapper" style={{color:'#641682',fontSize:'25px', fontFamily:"Montserrat-light"}}>
                                            Proposta em andamento
                                        </h4>
                                    </div>

                                    {/* CARD PROPOSTA */}
                                    <div className="col s12 m6 l4">
                                        <div className="card horizontal">
                                            <div className="card-stacked">
                                                <div className="card-content center">
                                                    <p style={{color:'#641682', fontFamily:'Montserrat-semibold'}}>Festa de Aniversário</p>
                                                    <p>Carapícuiba, São Paulo</p>
                                                    <p>Festa</p>
                                                </div>
                                                <div className="card-action rigth">
                                                    <a href="#" style={{color:'#641682'}}>ver detalhes</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    {/* TITULO PROPOSTA ACEITAS */}
                                    <div className="col l12 m12 s12">
                                        <h4 className="valign-wrapper" style={{color:'#641682',fontSize:'25px', fontFamily:"Montserrat-light"}}>
                                            Proposta aceitas
                                        </h4>
                                    </div>

                                    {/* CARD PROPOSTA ACEITAS */}
                                    <div className="col s12 m6 l4">
                                        <div className="card horizontal">
                                            <div className="card-stacked">
                                                <div className="card-content center">
                                                    <p style={{color:'#641682', fontFamily:'Montserrat-semibold'}}>Chá de bebê</p>
                                                    <p>Barueri, São Paulo</p>
                                                    <p>Festa</p>
                                                </div>
                                                <div className="card-action rigth">
                                                    <a href="#" style={{color:'#641682'}}>ver detalhes</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default Trabalhos;

import React from 'react'
import './css/Sessao2.css'
import {Onda02} from './ondas/Ondas'

function Sessao2(){
    return(
        <div>
            <div id="container-sessao2">
                <div style={{marginBottom:'-1em'}}>
                    <div className="container">
                        <div className="row">                
                            <div className="col l7 right-align hide-on-small-only">
                                <div id="quadado-img"></div>                    
                            </div>
                            <div className="col l5 s12" id="div-btn-cadastro">
                                <div className="row">
                                    <div className="col l12 s12 left-align">
                                        <h5>
                                            Quem somos ?
                                        </h5>
                                    </div>
                                    <div className="col l12 s12" id="desc-sobre-nos">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.
                                            Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.                                    
                                        </p>
                                    </div>                    
                                </div>
                            </div>
                        </div>
                    </div>
                <Onda02/>
                </div>
            </div>
        </div>
    )
}

export default Sessao2
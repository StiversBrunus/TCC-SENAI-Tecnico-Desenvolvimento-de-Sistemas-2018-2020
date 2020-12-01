import React from'react'
import './css/Sessao4.css'
import {Onda04} from './ondas/Ondas'
import FotografosImg from './imagens/desc_fotografo.png'
import ClienteImg from './imagens/desc_cliente.png'

function Sessao4(){
    return(
        <div id="container-sessao4">
            <div className="container center">
                <div className="row">
                    <div className="col l12 s12 center" id="titulos-juntar-nos">
                        <h5>Porque se juntas a nós ?</h5>
                    </div>
                    <div className="row center" id="div-area-cliente">
                        <div className="col l6 valign-wrapper hide-on-small-only">
                            <img src={ClienteImg} alt=""></img>
                        </div>                
                        <div className="col l6 s12 center" id="div-titulo-clientes">
                            <h5>
                                Clientes                          
                            </h5>
                            <p>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.
                                Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.
                                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.
                            </p>
                        </div>    
                    </div>
                    <div className="row center" id="div-area-fotografo">
                        <div className="col l6 center">
                            <h5>
                                Fotografos                            
                            </h5>
                            <p>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.
                                Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.
                                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.
                            </p>
                        </div>                 
                        <div className="col l6 valign-wrapper hide-on-small-only">
                            <img src={FotografosImg} alt=""></img>
                        </div>
                    </div>                
                </div>
            </div>
            <Onda04/>
        </div>
    )
}

export default Sessao4
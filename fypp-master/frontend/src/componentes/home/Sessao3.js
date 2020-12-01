import React from 'react'
import './css/Sessao3.css'
import {Onda03} from './ondas/Ondas'

function Sessao3(){
    return(
        <div>
            <div id="container-sessao3">
                <div className="container">
                    <div className="row valign-wrapper">                    
                        <div className="col l7 s12">
                            <div className="row">
                                <div className="col l6 s12" id="div-cards">
                                    <div className="row">
                                        <div className="col l12 s12">
                                            <div className="card">
                                                <div className="card-content white-text">
                                                <span className="card-title black-text center">Escolha seu fotógrafo</span>
                                                <p className="black-text">I am a very simple card. I am good at containing small bits of information.
                                                I am convenient because I require little markup to use effectively.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="row">
                                        <div className="col l12 s12">
                                            <div className="card">
                                                <div className="card-content white-text">
                                                <span className="card-title black-text center">Pagamento</span>
                                                <p className="black-text">I am a very simple card. I am good at containing small bits of information.
                                                I am convenient because I require little markup to use effectively.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="col l6 s12 valign-wrapper" style={{marginTop:"8em"}}>
                                    <div className="card">
                                        <div className="card-content white-text">
                                        <span className="card-title black-text center">E depois só aproveitar</span>
                                        <p className="black-text">I am a very simple card. I am good at containing small bits of information.
                                        I am convenient because I require little markup to use effectively.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>                  
                        </div>
                        <div className="col l5 s12" id="div-nossos-servicos">
                            <h5>
                                Nossos serviços                              
                            </h5>
                            <p>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.
                                Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.
                                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.
                                Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.
                                Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.                             
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <Onda03/>
        </div>
    )
}


export default Sessao3
import React from 'react'
import './css/Sessao5.css'
import {Onda05} from './ondas/Ondas'
import Fypp from './imagens/fundoFypp.png'
import GooglePlay from './imagens/baixar-google-playpng.png'
import AppleStore from './imagens/baixar-apple.png'

function Sessao5(){
    return(
        <div>
            <div id="container-sessao5" >
                <div className="container">
                    <div className="row valign-wrapper right-align" >
                        <div className="col l7 s12">
                            <div id="desc-mobile" className="valign-wrapper" className="row">
                                <div className="col l12 s12">
                                    <h4>APLICATIVO PARA O CELULAR</h4>
                                </div>
                                <div className="col l12 s12">
                                    <p>Baixer o nosso aplicativo no seu celular e tenha tudo o que há disponivel na web na palma de suas mãos.</p>
                                </div>
                                <div className="col l12 s12 center" style={{marginTop: "3em",paddingLeft:'5em'}}>
                                    <span>Baixe agora:</span>
                                </div>
                                <div className="col l6 s12 center" style={{marginTop: "1em",paddingLeft:'4em'}}>
                                    <img src={GooglePlay} alt='Faça o download na google play'></img>
                                </div>
                                <div className="col l6 s12 center" style={{marginTop: "1em",paddingLeft:'4em'}}>
                                    <img src={AppleStore} alt='Faça o download na apple store'></img>
                                </div>
                            </div>
                        </div>
                        <div className="col l5 hide-on-small-only" id="tela-fypp">
                            <img src={Fypp} alt=''></img>
                        </div>
                    </div>
                </div>   
            </div>
            <Onda05/>   
        </div>
            
    )
}

export default Sessao5
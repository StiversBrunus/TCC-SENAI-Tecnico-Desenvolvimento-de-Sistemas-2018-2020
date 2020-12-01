import React from 'react'
import './css/Sessao6.css'

function Sessao6(){
    return(
        <div id="container-sessao6">
            <div className="container center valign-wrapper">
                <div className="row center">
                    <div className="col l12 s12" id='tituloSecaoMensagem'>
                        <h4>Deixe sua mensagem para a gente</h4>
                    </div>
                    <div className="col l6 offset-l3 s12">
                        <form className="col s12">
                            <div className="row">
                                <div className="input-field col l6 s6">
                                    <input className="inputsDadosMensagem" id="nome" maxLength='50' type="text"></input>
                                    <label htmlFor="nome">Nome:</label>
                                </div>
                                <div className="input-field col l6 s6">
                                    <input className="inputsDadosMensagem" id="sobrenome" maxLength='50' type="text"></input>
                                    <label htmlFor="sobrenome">Sobrenome:</label>
                                </div>
                            </div>
                            <div className="row">
                                <div className="input-field col l12 s12">
                                    <input className="inputsDadosMensagem" id="email" type="email" maxLength='100'></input>
                                    <label htmlFor="email">Email</label>
                                </div>
                            </div>
                            <div className="row">
                                <div className="input-field col s12 s12">
                                    <textarea className="inputsDadosMensagem" id="mensagem" maxLength='250' className="materialize-textarea"></textarea>
                                    <label htmlFor="mensagem">Digite sua mensagem:</label>
                                </div>
                            </div>
                            <button className="waves-effect waves-light btn right" id="btn-enviar-home">
                                Enviar
                            </button>
                        </form>
                    </div>             
                </div>
            </div>
        </div>
    )
}

export default Sessao6;
import React, { Component } from 'react';
import InputMask from 'react-input-mask';

export class FormDocumentos extends Component {

    
    voltar = e => {
        e.preventDefault();
        this.props.etapaAnterior();
    };

    proxima = () => {
		this.props.proximaEtapa();
	};

	validacao = e => {
		e.preventDefault();
		if(this.props.validacao()){
			this.proxima();
		}
	};

    render() {
        const { values, handleChange } = this.props;
        return (
            <div id="coluna_dados_cadastro" className="col l6 s12 m12 center center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopLeftRadius: '0.5em', borderBottomLeftRadius: '0.5em' }}>
                <div className="row">
					<div className="col l12 center">
						<h4>
							WOW! Você está a procura de um fotógrafo?
							Conte-nos um pouco sobre você que lhe
							ajudamos a achar um perfeito para você.
						</h4>
					</div>
				</div>

                <div className="row">
                    <form className="col s12">
                        <div className="row">
                            <div className="input-field col s12">
                                <InputMask id="cpf" type="text" value={values.cpf} onChange={handleChange('cpf')} name="cpf" type="text" className="validate" mask="999.999.999-99"/>
                                <label htmlFor="cpf">CPF:</label>
                            </div>
                        </div>
                        <div className="row">
                            <div className="input-field col s12">
                                <input id="email" type="email" value={values.email} onChange={handleChange('email')} className="validate"/>
                                <label htmlFor="email">Email:</label>
                            </div>
                        </div>
                        <div className="row">
                            <div className="input-field col s12">
                                <input id="senha" type="password" value={values.senha} onChange={handleChange('senha')} className="validate"/>
                                <label htmlFor="senha">Senha:</label>
                            </div>
                        </div>

                        <div className="row">
                            <div className="valign-wrapper col s6">
                                <button onClick={this.voltar} className="right-align waves-effect waves-light btn right">
                                    <i className="material-icons left">
                                        arrow_back
                                    </i>Anterior
                                </button>                                   
                            </div>

                            <div className="col s6">
                                <button onClick={this.validacao} className="left-align waves-effect waves-light btn right">
                                    <i className="material-icons right">
                                        arrow_forward
                                    </i>Próximo
                                </button>
                            </div>                            
                        </div>
                    </form>
                </div>
            </div>
        );
    }
}

export default FormDocumentos;
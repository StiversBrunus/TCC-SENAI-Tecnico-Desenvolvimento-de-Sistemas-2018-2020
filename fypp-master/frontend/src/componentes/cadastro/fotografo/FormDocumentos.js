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
            <div id="coluna_dados_cadastro" className="col l6 s12 m12 center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopRightRadius: '0.5em', borderBottomRightRadius: '0.5em' }}>
                <h4 style={{ marginBottom: '1em' }}>
                    WOW! Nós também amamos<br></br>
                    fotografia! Conte-nos um<br></br>
                    pouquinho sobre você.
                </h4>

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
                                <input id="email" type="text" onChange={handleChange('email')} className="validate"></input>
                                <label htmlFor="email">Email:</label>
                            </div>
                        </div>
                        <div className="row">
                            <div className="input-field col s12">
                                <input id="senha" type="password" onChange={handleChange('senha')} className="validate"></input>
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
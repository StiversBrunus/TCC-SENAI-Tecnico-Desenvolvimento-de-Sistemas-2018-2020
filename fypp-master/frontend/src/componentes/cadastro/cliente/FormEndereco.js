import React, { Component } from 'react'
import InputMask from 'react-input-mask';

class FormEndereco extends Component {

    voltar = e => {
        e.preventDefault();
        this.props.etapaAnterior();
    };

    proxima = () => {
		this.props.proximaEtapa();
    };
    
    onChange = (e) => {
        this.props.buscarCep(e);        
    }

    validacao = e => {
		e.preventDefault();
		if(this.props.validacao()){
			this.proxima();
		}
	};

	

    buscarCep = (cep) => {
        // e.preventDefault();
        console.log('ceps:', cep)
        this.props.buscarCep(cep);
    };

    render() {
        const { values, handleChange } = this.props;
        
        return (
            <div>
                <div id="coluna_dados_cadastro" className="col l6 s12 m12 center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopRightRadius: '0.5em', borderBottomRightRadius: '0.5em' }}>
				<h4 style={{ marginBottom: '1em' }}>
					WOW! Nós também amamos<br></br>
                    fotografia! Conte-nos um<br></br>
                    pouquinho sobre você.
                </h4>

				<div className="row">
					<form className="col s12">
						<div className="row">
                            <div className="input-field col s6">
								<InputMask id="cep" type="text" onChange={(e) => this.onChange(e.target.value)} className="validate" mask="99999-999" />
								<label htmlFor="cep">CEP:</label>
							</div>
                            <div className="input-field col s6">
								<input disabled placeholder="UF" style={{color:'#808080'}} value={values.uf} id="uf" type="text" className="validate" mask="99999-999" />
								{/* <label htmlFor="uf">UF:</label> */}
							</div>
						</div>

                        <div className="row">
                            <div className="input-field col s9">
								<input disabled placeholder="Endereço" style={{color:'#808080'}} value={values.endereco} id="endereco" type="text"  className="validate" mask="99999-999" />
								{/* <label htmlFor="endereco">Endereço:</label> */}
							</div>
                            <div className="input-field col s3">
								<input id="numero" type="text" value={values.numeroCasa} onChange={handleChange('numeroCasa')} className="validate" mask="99999-999" />
								<label htmlFor="numero">Número:</label>
							</div>
						</div>

                        <div className="row">
                            <div className="input-field col s6">
								<input disabled placeholder="Bairro" style={{color:'#808080'}} value={values.bairro} id="bairro" type="text" className="validate" mask="99999-999" />
								{/* <label htmlFor="bairro">Bairro:</label> */}
							</div>
                            <div className="input-field col s6">
								<input disabled placeholder="Cidade" style={{color:'#808080'}} value={values.cidade} id="cidade"  type="text" className="validate" mask="99999-999" />
								{/* <label htmlFor="cidade">Cidade:</label> */}
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
            </div>
        )
    }
}

export default FormEndereco

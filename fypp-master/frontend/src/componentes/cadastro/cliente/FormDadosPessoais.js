import React, { Component } from 'react';
import InputMask from 'react-input-mask';

export class FormDadosPessoais extends Component {

	proxima = () => {
		// e.preventDefault();
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
			<div id="coluna_dados_cadastro" className="col l6 s12 m12 center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopLeftRadius: '0.5em', borderBottomLeftRadius: '0.5em' }}>
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
					<form className="col s12" id="form_contato">
						<div className="row">
							<div className="input-field col s12">
								<input id="nome" type="text" value={values.nome} onChange={handleChange('nome')} name="nome" type="text" className="validate"/>
								<label htmlFor="nome">Nome:</label>
							</div>
						</div>
						<div className="row">
							<div className="input-field col s12">
								<InputMask id="datanascimento" type="text" value={values.data_nascimento} onChange={handleChange('data_nascimento')} className="validate" mask="99/99/9999"/>
								<label htmlFor="datanascimento">Data Nascimento:</label>
							</div>	
						</div>
						<div className="row">
							<div className="input-field col s12">
								<InputMask id="telefone" type="text" value={values.telefone} onChange={handleChange('telefone')} className="validate" mask="(99) 99999-9999"/>
								<label htmlFor="telefone">Telefone:</label>
							</div>
						</div>
						<div className="row valign-wrapper" >
                            <div className="left-align col s12">
								<button className="" onClick={this.validacao} className="waves-effect waves-light btn right">
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

export default FormDadosPessoais;
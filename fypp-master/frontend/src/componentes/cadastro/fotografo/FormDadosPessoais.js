import React, { Component } from 'react';
import InputMask from 'react-input-mask';
import SelectExperiencia from './select/selectExperiencia'

export class FormDadosPessoais extends Component {

	proxima = () => {
		// e.preventDefault();
		this.props.proximaEtapa();
	};

	validacao = e => {
		e.preventDefault();
		if(this.props.validacao()){
			e.preventDefault();
			this.proxima();
		}
	};

	selecaoTipoFotografo = e => {
		e.preventDefault();
		this.props.selecaoTipoFotografo(e)
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
								<input id="nome" type="text" value={values.nome} onChange={handleChange('nome')} name="nome" type="text" className="validate"></input>
								<label htmlFor="nome">Nome:</label>
							</div>
						</div>
						<div className="row">
							<div className="input-field col s6">
								<InputMask id="telefone" type="text" value={values.telefone} onChange={handleChange('telefone')} className="validate" mask="(99) 99999-9999"/>
								<label htmlFor="telefone">Telefone:</label>
							</div>
							<div className="input-field col s6">
								<InputMask id="datanascimento" type="text" value={values.data_nascimento} onChange={handleChange('data_nascimento')} className="validate" mask="99/99/9999"/>
								<label htmlFor="datanascimento">Data Nascimento:</label>
							</div>							
						</div>
						<div className="row">
							<div className="input-field col s12">
								<SelectExperiencia id="tipoFotografo" onChange={this.selecaoTipoFotografo}/>
							</div>
						</div>
						
						<button style={{ marginBottom: '1.9em', marginRight: '1.5em' }} onClick={this.validacao} className="waves-effect waves-light btn right">
							<i className="material-icons right">
								arrow_forward
                        	</i>Próximo
                  		</button>
					</form>
				</div>
			</div>
		);
	}
}

export default FormDadosPessoais;
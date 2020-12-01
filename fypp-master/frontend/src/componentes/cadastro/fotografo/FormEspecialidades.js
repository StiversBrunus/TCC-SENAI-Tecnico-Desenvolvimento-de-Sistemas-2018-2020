import React, { Component } from 'react';

export class FormEspecialidades extends Component {

	voltar = e => {
		e.preventDefault();
		this.props.etapaAnterior();
	};

	proxima = () => {
		this.props.proximaEtapa();
	};

	validacao = e => {
		e.preventDefault();
		if (this.props.validacao()) {
			this.proxima();
		}
	};


	handleCheckbox = (e, especialidade) => {
		this.props.handleCheckbox(e, especialidade);
	}

	handleChecked = e => {
		e.preventDefault();
		this.props.handleChecked();
	}

	componentDidMountFunction = e => {
		e.preventDefault();
		this.props.componentDidMountFunction();
	}

	componentDidMount() {
		this.props.componentDidMountFunction();
	}

	render() {
		const { isChecked } = this.props
		const { especialidades } = this.props

		return (
			<div id="coluna_dados_cadastro" className="col l6 s12 m12 center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopRightRadius: '0.5em', borderBottomRightRadius: '0.5em' }}>
				<h4 style={{ marginBottom: '1em' }}>
					WOW! Nós também amamos<br></br>
                    fotografia! Conte-nos um<br></br>
                    pouquinho sobre você.
                </h4>

				<div className="row" style={{ height: '20.6em', boxSizing: 'border-box' }}>
					<form className="col s12">
						{especialidades.map((especialidade, index) => (
							<div className="col s6" key={index}>
								<div className="left" >
									<label>
										<input type="checkbox" checked={this.isChecked} value={especialidade.id} onChange={(e) => this.handleCheckbox(e, especialidade)} />
										<span className="color-black">{especialidade.nome}</span>
									</label>
								</div>
							</div>
						))}
					</form>
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
			</div>
		);
	}
}

export default FormEspecialidades;
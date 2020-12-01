import React, { Component } from 'react'
import api from '../../../services/api'
import Swal from 'sweetalert2'
import M from 'materialize-css'

const stateInicial = {
	email: '',
	senha: '',
	emailError: '',
	senhaError: ''
}

class FormFotografo extends Component {
	state = stateInicial

	constructor(props) {
		super(props)				
	}

	setEmail = (e) => {
        this.setState({
			email: e.target.value
		});
	}
	
	setSenha = (e) => {
        this.setState({
			senha: e.target.value
		});
	}

	alertError = () => {
		Swal.fire({
			icon: 'error',
			title: 'Erro ao efetuar login',
			text: 'Usuario ou senha invalido'		
		})
	}

	location = () => {
		this.props.location();
	}

	validacao = () => {
		let emailError = ''
		let senhaError = ''

		if(this.state.senha == ''){
			senhaError = "Digite sua senha"
		}

		if(this.state.email == ''){
			emailError = "Preencha o email";
		}else if(!this.state.email.includes('@') || !this.state.email.includes('.com')){
			emailError = "Email invalido";
		}

		if(emailError){
			this.setState({emailError})
			M.toast({ html: this.state.emailError })
			return false;
		}

		if(senhaError){
			this.setState({senhaError})
			M.toast({ html: this.state.senhaError })
			return false;
		}
		
		return true
	}

	autenticar = async (event) => {
		event.preventDefault()

		const validado = this.validacao();

		if(validado){
			let config = {
				headers: {
				  "Content-Type": "application/json",
				  'Access-Control-Allow-Origin': '*',
				  "Access-Control-Allow-Headers": "Authorization", 
				  "Access-Control-Allow-Methods": "GET, POST, OPTIONS, PUT, PATCH, DELETE"
				  }
				}
	
			const dados = {
				email: this.state.email,
				senha: this.state.senha
			}
	
			await api.post('/photo/auth/login', dados, config).then((res) => {
				console.log(res.data)
				localStorage.setItem("tokenFotografo", res.data.token)
				localStorage.setItem("emailFotografo", res.data.email)
				localStorage.setItem("nomeFotografo", res.data.nome)
				localStorage.setItem("fotoPerfilFotografo", res.data.foto_perfil)
				localStorage.setItem("idFotografo", res.data.id)

				console.log(res)

				console.log(res.data)
				this.location()
				// this.props.history.push('/fotografo/trabalhos')
			}).catch(erro => {
				console.log(erro)
				this.alertError()
			})
		}
	}

	render() {
        return (
            <div id="coluna_dados_cadastro" className="col l6 s12 m12 center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopLeftRadius: '0.5em', borderBottomLeftRadius: '0.5em' }}>
                <h4 style={{ marginBottom: '3em' }}>
                    WOW! Seja bem-vindo novamente.<br></br>
                    Informe suas credenciais para<br></br>
					acessar sua conta
                </h4>

                <div className="row">
                    <form className="col s12">
						<div className="row">
							<div className="input-field col s12">
							<input id="first_name" type="text" value={this.state.e} onChange={this.setEmail} className="validate" />
								<label htmlFor="first_name">Email:</label>
							</div>
						</div>
						<div className="row"></div>
						<div className="row" style={{marginBottom:'4em'}}>
							<div className="input-field col s12">
								<input id="password" type="password" onChange={this.setSenha} className="validate" />
								<label htmlFor="password">Senha:</label>
							</div>
						</div>

                        <div className="row right">
							<button style={{ marginBottom: '0.7em', marginRight:'3em'}} className="btn waves-effect waves-light submitFrmLogin" onClick={this.autenticar} type="button" name="action">
								Entrar
							</button>
						</div>
                    </form>
                </div>
            </div>
        );
    }
}


export default FormFotografo;
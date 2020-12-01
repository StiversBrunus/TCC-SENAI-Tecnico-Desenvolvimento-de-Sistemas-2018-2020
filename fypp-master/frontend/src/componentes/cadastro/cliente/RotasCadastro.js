import React, { Component } from 'react';
import FormDadosPessoais from './FormDadosPessoais';
import FormDocumentos from './FormDocumentos';
import FormEndereco from './FormEndereco'
import FormFotoPerfil from './FormFotoPerfil';
import api from '../../../services/api'
// import Swal from 'sweetalert2'
import { alertSucess, alertError } from '../../alerts/alert'
import $ from 'jquery';
import M from 'materialize-css'
import axios from 'axios'

class RotasCadastro extends Component {
	constructor(props) {
		super(props)

		this.stateInicial = {
			etapa: 1,
			nome: '',
			cep: '',
			telefone: '',
			email: '',
			senha: '',
			cpf: '',
			file: '',
			errosCepCaixaVazia: '',
			erroMinimoCaracter: '',
			erroMaximoCaracter: '',
			erroNumero: '',
			erroCelular: '',
			erroEmailInvalido: '',
			erroSenha: '',
			erroCpf: '',
			erroCpfIncompleto: '',
			filename: '',
			mimetype: '',
			base64: '',
			data_nascimento:'',
			erroData_nascimento: '',
			
			foto_perfil:'',
			imagemPerfil: [],
			dados : {
				filename: '',
				mimetype: '',
				base64: '',
			},

			erroNumeroVazio:'',
			bairro:'',
			cidade:'',
			uf:'',
			endereco:'',
			numeroCasa:'',
			idEndereco:'',
		}
		this.state = this.stateInicial
	}

	location = () => {
		this.props.location();
	}

	//Função que leva para a proxima etapa do formulario
	proximaEtapa = () => {
		const { etapa } = this.state;
		this.setState({
			etapa: etapa + 1
		});
	};

	//Função que leva para a etapa anterior do formulario
	etapaAnterior = () => {
		const { etapa } = this.state;
		this.setState({
			etapa: etapa - 1
		});
	};

	//validação da primeira etapa do formulario
	validacaoPrimeiroForm = () => {
		let erroMinimoCaracter = "";
		// let errosCepCaixaVazia = "";
		let erroMaximoCaracter = "";
		let erroNumero = "";
		let erroCelular = "";

		if (this.state.nome.length < 3 || this.state.nome.length == '') {
			erroMinimoCaracter = 'Dígite seu nome, no mínimo 3 caracteres!'
		}

		if (this.state.telefone == 0 || this.state.telefone.length == 1) {
			erroCelular = 'Dígite o seu telefone!';
		}

		if (!this.state.nome.match(/^[a-zA-Z ]*$/)) {
			erroNumero = 'Dígite apenas letras, números não são permitido!'
		}

		if (erroMinimoCaracter || erroMaximoCaracter || erroNumero || erroCelular) {
			if (erroMinimoCaracter) {
				this.setState({ erroMinimoCaracter });
				M.toast({ html: this.state.erroMinimoCaracter })
			}

			if (erroMaximoCaracter) {
				this.setState({ erroMaximoCaracter });
				M.toast({ html: this.state.erroMaximoCaracter })
			}

			if (erroNumero) {
				this.setState({ erroNumero });
				M.toast({ html: this.state.erroNumero })
			}

			if (erroCelular) {
				this.setState({ erroCelular });
				M.toast({ html: this.state.erroCelular })
			}

			return false
		}

		return true
	}

	buscarCep = async (cep) => { 
		
		const cepHifen = cep;
		const cepReplace = cepHifen.replace('-', '')

		await axios.get('https://viacep.com.br/ws/'+ cepReplace +'/json/')
            .then((res) => {
				this.setState({
					uf: res.data.uf,
					endereco: res.data.logradouro,
					bairro: res.data.bairro,
					cidade: res.data.localidade,
					cep: cepReplace,
				})
            }).catch(erro =>{
				console.log(erro)
            })
    }

	//validação da segunda etapa do formulario
	validacaoSegundoForm = () => {
		let erroEmailInvalido = '';
		let erroSenha = '';
		let erroCpf = '';
		let erroCpfIncompleto = ''
		const M = window.M;

		if (!this.state.email.includes('@') || !this.state.email.includes('.com')) {
			erroEmailInvalido = 'E-mail incorreto!'
		}

		if (this.state.senha.length < 8 || this.state.senha.length == 0) {
			erroSenha = ('Dígite sua senha, no mínimo 8 caracteres!')
		}

		if (this.state.cpf == 0) {
			erroCpf = 'Por Favor, dígite o seu cpf!';
		}

		if (this.state.cpf.length != 14) {
			erroCpfIncompleto = 'Por Favor, dígite um cpf válido!';
		}

		if (erroEmailInvalido || erroSenha || erroCpf || erroCpfIncompleto) {
			if (erroEmailInvalido) {
				this.setState({ erroEmailInvalido });
				M.toast({ html: this.state.erroEmailInvalido })
			}

			if (erroSenha) {
				this.setState({ erroSenha });
				M.toast({ html: this.state.erroSenha })
			}

			if (erroCpfIncompleto) {
				this.setState({ erroCpfIncompleto });
				M.toast({ html: this.state.erroCpfIncompleto })
			}

			if (erroCpf) {
				this.setState({ erroCpf });
				M.toast({ html: this.state.erroCpf })
			}

			return false
		}

		return true
	}

	//função que guarda a imagem no banco 
	handleImageChange = (event) => {
		let file = event.target.files[0];
		this.setState({imagemPerfil: file})
		let reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onloadend = () => {			
			$('#fotoDePerfil').attr('src', reader.result);		
		}
	}

	UploadImage = () => {
		let imagem = this.state.imagemPerfil
		console.log(imagem)
		let file = imagem;
		
		let reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onloadend = () => {			
			const base64result = reader.result.split(',')[1]
			const name = file.name.split(' ')[0]
				this.setState({
					dados: {
						filename: Date.now() + name,
						mimetype: file.type,
						base64: base64result
					}
				})
				

				console.log(this.state.dados)
			
			api.post("/photo/upload/imagem", this.state.dados).then(res => {			
				this.setState({
					foto_perfil: res.data
				})
				this.cadastrar()
			}).catch(erro => {
				console.log(erro)
			})
		}
	}

	validacaoCep = () => {
		let errosCepCaixaVazia = "";
		let erroNumeroVazio = "";

		if (this.state.endereco == undefined) {
			errosCepCaixaVazia = 'Dígite um cep válido!';
		}

		if (this.state.numeroCasa == 0) {
			erroNumeroVazio = 'Preencha o número!';
		}

		if(errosCepCaixaVazia || erroNumeroVazio){
			
			if (errosCepCaixaVazia) {
				this.setState({ errosCepCaixaVazia });
				M.toast({ html: this.state.errosCepCaixaVazia })
			}

			if (erroNumeroVazio) {
				this.setState({ erroNumeroVazio });
				M.toast({ html: this.state.erroNumeroVazio })
			}

			return false
		}

		return true
	}

	cadastrar = async (e) => {
		let endereco = {
			numero: this.state.numeroCasa,
			rua: this.state.endereco,
			bairo: this.state.bairro,
			cidade: this.state.cidade,
			estado: this.state.uf,
			pais:"br", 
			cep: this.state.cep
		}
		
		await api.post('/photo/endereco/', endereco).then((res) => {
			this.setState({
				idEndereco: res.data.id
			})
			this.cadastroCliente();
		}).catch(erro => {
			console.log(erro)
		})
	}

	cadastroCliente = async () => {
		let dados = {}

		dados = {
			nome: this.state.nome,
			cep: this.state.cep,
			telefone: this.state.telefone,
			email: this.state.email,
			role: "ADMIN",
			senha: this.state.senha,
			fotoPerfil: this.state.foto_perfil,
			enderecos:{ id: this.state.idEndereco}
		}

		console.log(this.state.foto_perfil)

		await api.post('/photo/cliente', dados).then((res) => {
			this.setState(this.stateInicial)
			alertSucess('Obrigado!','Sua conta foi criada com sucesso' )
			this.location()
			console.log(res.data)
		}).catch(erro => {
			alertError('Erro ao cadastrar','Tivemos algum problema com o seu cadastro, por favor tente novamente')
			console.log(erro)
		})
	}

	//inputHandler
	handleChange = input => e => {
		this.setState({ [input]: e.target.value });
	};

	render() {
		const { etapa } = this.state;
		const { nome, cep, telefone, email, senha, cpf, base64, mimetype, data_nascimento, cidade, uf, numeroCasa, endereco, bairro } = this.state;
		const values = { nome, cep, telefone, email, senha, cpf, data_nascimento, cidade, uf, numeroCasa, endereco, bairro };

		//switch que controla as etapas do processo de cadastro
		switch (etapa) {
			case 1:
				return (
					//Renderizando o objeto e passando propriedades para ele
					<FormDadosPessoais
						proximaEtapa={this.proximaEtapa}
						handleChange={this.handleChange}
						validacao={this.validacaoPrimeiroForm}
						values={values}
					/>
				);
			case 2:
				return (
					<FormEndereco
						proximaEtapa={this.proximaEtapa}
						etapaAnterior={this.etapaAnterior}
						buscarCep={this.buscarCep}
						cep={this.state.cep}
						handleChange={this.handleChange}
						validacao={this.validacaoCep}
						values={values}
					/>				
				);				
			case 3:
				return (
					<FormDocumentos
						etapaAnterior={this.etapaAnterior}
						proximaEtapa={this.proximaEtapa}
						handleChange={this.handleChange}
						validacao={this.validacaoSegundoForm}
						values={values}
					/>					
				);
			case 4:
				return (
					<FormFotoPerfil
						cadastrar={this.UploadImage}
						etapaAnterior={this.etapaAnterior}
						handleChange={this.handleChange}
						handleImageChange={this.handleImageChange}
					/>
				);
			default:
				(alert('error'))
		}
	}
}

export default RotasCadastro;
